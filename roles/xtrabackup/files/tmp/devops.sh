## xtrabackup 2.3 版本 innobackupex 是 Perl 脚本
## xtrabackup 2.4 版本 innobackupex 是 C 程序
## xtrabackup 8.0 版本 innobackupex 开始弃用
## xtrabackup 2.4 版本 适应 MySQL Server 5.7 与 Percona Server 5.7
## xtrabackup 8.0 版本 适应 MySQL Server 8.0 与 Percona Server 8.0

######################################## xtrabackup 2.4 版本 ########################################
sudo innobackupex --use-memory=4G --deaults-file=/etc/my.cnf --host=127.0.0.1 --user=root --password=mysql_pass_cli /var/www/any-devops-python/.xtrabackup/


######################################## xtrabackup 8.0 版本 ########################################
## 热备份需要连 sys mysql imformation_schema performance_schema 一起备份
sudo xtrabackup --backup --host=localhost --user=backup --password=mysql_pass_backup  --target-dir=/var/www/any-devops-python/.xtrabackup/ --parallel=2

sudo xtrabackup --backup --host=localhost --user=backup --password=mysql_pass_backup  --target-dir=/var/www/any-devops-python/.xtrabackup/ --parallel=2


############################################ 回复备份 ############################################
sudo service mysqld stop
sudo rm -R /var/lib/mysql/*

sudo xtrabackup --defaults-file=/etc/my.cnf --use-memory=4G --copy-back --rsync  --apply-log --redo-only --target-dir=/var/www/any-devops-python/.xtrabackup/now

sudo chown -R mysql:mysql /var/lib/mysql
sudo service mysqld start

############################################ 回复备份 ############################################


sudo xtrabackup --prepare --host=localhost --user=backup --password=mysql_pass_backup  --target-dir=/var/www/any-devops-python/.xtrabackup/ --parallel=8

## --apply-log 该选项表示同xtrabackup的--prepare参数,
## 一般情况下,在备份完成后，数据尚且不能用于恢复操作，因为备份的数据中可能会包含尚未提交的事务或已经提交但尚未同步至数据文件中的事务。
## 因此，此时数据 文件仍处理不一致状态。--apply-log的作用是通过回滚未提交的事务及同步已经提交的事务至数据文件使数据文件处于一致性状态。 
sudo xtrabackup --prepare --apply-log-only  --use-memory=4G --user=backup --password=mysql_pass_backup --target-dir=/var/www/any-devops-python/.xtrabackup/


########################################## 备份 并还原 单一表的方法 ########################################## 

sudo xtrabackup --defaults-file=/etc/my.cnf --copy-back --rsync --target-dir=/var/www/any-devops-python/.xtrabackup/

########################################## 备份 并还原 单一表的方法 ########################################## 



# 增量备份
## 全量
sudo xtrabackup --defaults-file=/etc/my.cnf /var/www/any-devops-python/.xtrabackup/





sudo xtrabackup --backup --defaults-file=/etc/my.cnf --target-dir=/var/www/any-devops-python/.xtrabackup/


Xtrabackup全量备份与恢复
sudo xtrabackup --defaults-file=/etc/my.cnf --backup /var/www/any-devops-python/.xtrabackup/
sudo xtrabackup --copy-back --target-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05_17-56-04