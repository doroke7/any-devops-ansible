
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
ansible-playbook playbooks/nginx.yml --extra-vars "branch=fea"
`

`
ansible-playbook playbooks/nginx.yml --extra-vars "branch=feature"

`

`
ansible-playbook playbooks/nginx.yml --extra-vars "branch=feature php_version=7.3"

`

`
ansible-playbook playbooks/nginx.yml
`

`
ansible-playbook playbooks/main.yml --tags "nginx" --extra-vars "branch=feature"
`

`
ansible-playbook playbooks/php.yml -e '{ "branch": "feature" }'
`

## 5. install nginx of all environtment via ansible
`
ansible-playbook playbooks/nginx.yml --extra-vars "branch=all"
`

## 6. install nginx, php of any environtment via ansible
`
ansible-playbook playbooks/main.yml --tags "nginx, php"
`

## 7. install any of any environtment via ansible with debug mode
`
ansible-playbook playbooks/main.yml --tags "nginx, php, node, mysql, mongodb" --extra-vars "debug=true"
`

`
ansible-playbook playbooks/main.yml --extra-vars "debug=true"
`

## 8. ansilbe host 是有 cache 机制 如果换了 ssh key 还是 无法连， 试试改个 host 名
`
略
`




1. 本地环境使用 Vagrant + CentOS7
2. 统一使用 Ansilbe 管理工具
3. 新的项目 禁止使用 PHPadmin, 宝塔 等 WEB 管理界面，WEB 界面 无非是开启了 端口给人攻击 （旧项目不管）
4. 使用 Python 做运营自动化 脚本 （亦可使用 Golang）
5. 自动化 脚本 使用 GIT并做版本控管
6. 所有綫上項目保持與 GIT 最新版 保持一致
7. 每一天需要做运维日志并交接