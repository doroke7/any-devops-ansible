
# Ansible CLI 说明

## 1. use playbook
`
ansible-playbook playbooks/nginx.yml
`

## 2. use playbook via verbose
`
ansible-playbook playbooks/nginx.yml -vvv
`

## 3. command line in remote server via ansible
`
ansible fea_nginx -a "/sbin/nginx -v"
`

## 4. install nginx of feature environtment via ansible
`
ansible-playbook -i hosts/hosts.fea playbooks/php.yml -e "php_version=7.3"

ansible-playbook -i hosts/hosts.fea playbooks/mysql.yml -e "mysql_version=5.6"

ansible-playbook -i hosts/hosts.fea playbooks/git.yml

ansible-playbook -i hosts/hosts.fea playbooks/nginx.yml

ansible-playbook -i hosts/hosts.fea playbooks/redis.yml

ansible-playbook -i hosts/hosts.fea playbooks/memcached.yml

ansible-playbook -i hosts/hosts.fea playbooks/mongodb.yml

ansible-playbook -i hosts/hosts.fea playbooks/python.yml -e "python_version=3.6"

ansible-playbook -i hosts/hosts.fea playbooks/node.yml
`
## 8. ansilbe host 是有 cache 机制 如果换了 ssh key 还是 无法连， 试试改个 host 名
`
略
`
## 9. 安裝 獸獸項目 MYSQL 基本數據， 記得 務必  標識 mysql_version!!!!!!!!!!!!!!!!!!!!!!!!!

`
ansible-playbook -i hosts/shoushou_video.mas playbooks/shoushou_video.yml --tags "mysql" -e "mysql_version=8.0"
`


## 运维注意事项
1. 本地环境使用 Vagrant + CentOS7
2. 统一使用 Ansilbe 管理工具
3. 研发项目 禁止使用 PHPadmin, 宝塔 等 WEB 管理界面，WEB 界面 无非是开启了 端口给人攻击
4. 使用 Python 做运营自动化 脚本 （亦可使用 Golang）
5. 自动化 脚本 使用 GIT并做版本控管
6. 所有綫上項目保持與 GIT 最当前版本 保持一致
7. 統一使用 GitLab CI 自動化 更新
8. 所有服務機 【外網】 使用 SSH KEY 登入 （例如 MYSQL 使用 SSH 登入后 再 連綫 localhost）
9. 每一天需要做运维日志并交接

## 运维必备环境
 1. 安装 Vagrant
 2. 安装 VirtualBox
 3. 安装 Xshell
 4. 安装 Navicat
 5. 安装 Notepad++
 6. 安装 Sublime
 7. 安装 Postman
 8. 安装 Pycharm
 9. 安装 Git for Win
10. 安装 Git tortoise
10. 安装 Source Tree