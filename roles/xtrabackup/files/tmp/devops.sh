## xtrabackup 2.3 版本 innobackupex 是 Perl 脚本
## xtrabackup 2.4 版本 innobackupex 是 C 程序
## xtrabackup 8.0 版本 innobackupex 开始弃用
## innobackupex 兼容性不好 对于 MySQL 版本兼容不佳

## xtrabackup 2.4 版本 适应 MySQL Server 5.7 与 Percona Server 5.7
## xtrabackup 8.0 版本 适应 MySQL Server 8.0 与 Percona Server 8.0

######################################## xtrabackup [2.3] 版本 ########################################
sudo innobackupex --use-memory=4G --deaults-file=/etc/my.cnf --host=127.0.0.1 --user=root --password=mysql_pass_cli /var/www/any-devops-python/.xtrabackup/


######################################## xtrabackup [2.4] [8.0] 版本 ########################################
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



# 增量备份与恢复

## 1. 以 xtraback 备份 基本 数据
sudo xtrabackup --defaults-file=/etc/my.cnf --backup --use-memory=4G --target-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05/2020-09-05 --parallel=8

## 2. 以 xtraback 备份 以 【基本 上一次的 增量数据  --incremental-basedir 】为基础，  并产生  【增量数据 --target-dir】 
sudo xtrabackup --defaults-file=/etc/my.cnf --backup --use-memory=4G --target-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05/1 --incremental-basedir=/var/www/any-devops-python/.xtrabackup/2020-09-05/2020-09-05 --parallel=8
sudo xtrabackup --defaults-file=/etc/my.cnf --backup --use-memory=4G --target-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05/2 --incremental-basedir=/var/www/any-devops-python/.xtrabackup/2020-09-05/1 --parallel=8
sudo xtrabackup --defaults-file=/etc/my.cnf --backup --use-memory=4G --target-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05/3 --incremental-basedir=/var/www/any-devops-python/.xtrabackup/2020-09-05/2 --parallel=8
sudo xtrabackup --defaults-file=/etc/my.cnf --backup --use-memory=4G --target-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05/4 --incremental-basedir=/var/www/any-devops-python/.xtrabackup/2020-09-05/3 --parallel=8
sudo xtrabackup --defaults-file=/etc/my.cnf --backup --use-memory=4G --target-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05/5 --incremental-basedir=/var/www/any-devops-python/.xtrabackup/2020-09-05/4 --parallel=8


## 3. 以 xtraback 准备基本数据
sudo xtrabackup --defaults-file=/etc/my.cnf --prepare --apply-log-only --use-memory=4G --target-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05/2020-09-05 --parallel=8

## 4. 以 xtraback 把增量数据 倒入 基本数据中 , [[[最后一次 不要加入 --apply-log-only ]]]
sudo xtrabackup --defaults-file=/etc/my.cnf --prepare --apply-log-only --use-memory=4G --target-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05/2020-09-05  --incremental-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05/1 --parallel=8
sudo xtrabackup --defaults-file=/etc/my.cnf --prepare --apply-log-only --use-memory=4G --target-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05/2020-09-05  --incremental-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05/2 --parallel=8
sudo xtrabackup --defaults-file=/etc/my.cnf --prepare --apply-log-only --use-memory=4G --target-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05/2020-09-05  --incremental-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05/3 --parallel=8
sudo xtrabackup --defaults-file=/etc/my.cnf --prepare --apply-log-only --use-memory=4G --target-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05/2020-09-05  --incremental-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05/4 --parallel=8

sudo xtrabackup --defaults-file=/etc/my.cnf --prepare --use-memory=4G --target-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05/2020-09-05 --incremental-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05/5 --parallel=8

## 5. 以 xtraback 把 基本数据 与 增量数据 倒入 MySQL ,  
sudo xtrabackup --defaults-file=/etc/my.cnf --copy-back --rsync --use-memory=4G --target-dir=/var/www/any-devops-python/.xtrabackup/2020-09-05/2020-09-05 --parallel=8

