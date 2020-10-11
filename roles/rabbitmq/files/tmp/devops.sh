 # sudo rabbitmqctl add_user 'backend';
 sudo rabbitmqctl add_user 'backend' 'rabbitmq_pass';
 sudo rabbitmqctl add_vhost '/';

# First ".*" for configure permission on every entity
# Second ".*" for write permission on every entity
# Third ".*" for read permission on every entity
sudo rabbitmqctl set_permissions -p "default" "backend" ".*" ".*" ".*"
sudo rabbitmqctl set_permissions -p "/" "backend" ".*" ".*" ".*"

sudo rabbitmqctl set_user_tags backend administrator

# 开启 RabbitMQ WEB GUI
sudo rabbitmq-plugins enable rabbitmq_management


# 查看 rabbitMQ 基本配置   类似 nginx -t
rabbitmq-diagnostics status

rabbitmqctl stop [{pid_file}]
# 表示stop 在RabbitMQ服务器上运行的一个Erlang 节点，可以指定某一个 *pid_file*，表示会等待这个指定的程序结束


rabbitmqctl shutdown
# 表示终止RabbitMQ 服务器上的Erlang进程，如果终止失败，会返回非零数字


rabbitmqctl stop_app
# 表示终止RabbitMQ的应用，但是Erlang节点还在运行。该命令典型的运行在一些需要RabbitMQ应用被停止的管理行为之前，例如 reset


rabbitmqctl start_app
# 表示启动RabbitMQ的应用。该命令典型的运行在一些需要RabbitMQ应用被停止的管理行为之后，例如 reset


rabbitmqctl wait {pid_file}
# 表示等待RabbitMQ应用启动。该命令会等待指定的pid file被创建，也就是启动的进程对应的pid保存在这个文件中，然后RabbitMQ应用在这个进程中启动。如果该进程终止，没有启动RabbitMQ应用，就会返回错误。
# 合适的pid file是有rabbitmq-server 脚本创建的，默认保存在 Mnesia 目录下，可以通过修改 RABBITMQ_PID_FILE 环境变量来修改
# 例如 rabbitmqctl wait /var/run/rabbitmq/pid


rabbitmqctl reset
# 表示设置RabbitMQ节点为原始状态。会从该节点所属的cluster中都删除，从管理数据库中删除所有数据，例如配置的用户和vhost，还会删除所有的持久消息。
# 要想reset和force_reset操作执行成功，RabbitMQ应用需要处于停止状态，即执行过 stop_app


rabbitmqctl force_reset
# 表示强制性地设置RabbitMQ节点为原始状态。它和reset的区别在于，可以忽略目前管理数据库的状态和cluster的配置，无条件的reset。
# 该方法的使用，应当用在当数据库或者cluster配置损坏的情况下作为最后的方法。


rabbitmqctl rotate_logs {suffix}
# 表示将日志文件的内容追加到新的日志文件中去，这个新的日志文件的文件名是原有的日志文件名加上命令中的 suffix，并且恢复日志到原来位置的新文件中。
# 注意：如果新文件原先不存在，那么会新建一个；如果suffix为空，那么不会发生日志转移，只是重新打开了一次日志文件而已。


rabbitmqctl hipe_compile {directory}
# 表示在指定的目录下执行HiPE编译和缓存结果文件 .beam-files
# 如果需要父目录会被创建。并且在编译之前，该目录下的所有 .beam-files会被自动删除。
# 使用预编译的文件，你应该设置 RABBITMQ_SERVER_CODE_PATH 环境变量为 hipe_compile 调用指定的目录。



# Source：源头的意思，其实就是 Exchange。
# destination：目的地的意思，其实就是 Queue。
# routing_key：路由键的规则，用于 Queue 匹配（比如test.#）。


sudo rabbitmqadmin -H 127.0.0.1 -u backend -p rabbitmq_pass list vhosts

sudo rabbitmqadmin -H 127.0.0.1 -u backend -p rabbitmq_pass list queues

sudo rabbitmqadmin -H 127.0.0.1 -u backend -p rabbitmq_pass get queue=test

sudo rabbitmqadmin -H 127.0.0.1 -u backend -p rabbitmq_pass declare exchange name=my.topic type=topic


sudo rabbitmqadmin -H 127.0.0.1 -u backend -p rabbitmq_pass list bindings


# 推送 playload Hello xxx 消息 给交换机 my.topic 其中 路由关键字是  my.test
# 注意 RabbitMQ 是不直接推送 
sudo rabbitmqadmin publish routing_key=my.test exchange=my.topic  payload="hello world by my.test"

# 把 队列 test 分配到 交换机 my.topic 旗下， 指定 路由  my.#
# 使用路由分配的优点是 可做到 一个 publish 多个 subscribe 的效果
sudo rabbitmqadmin -H 127.0.0.1 -u backend -p rabbitmq_pass declare binding source=my.topic destination=test routing_key=my.#


sudo rabbitmqadmin purge queue name=name_of_the_queue_to_be_purged


# rabbitmq 的建议配置架构
## vhost 区分项目
## exchange 区分功能模块
## quequ 区分功能点