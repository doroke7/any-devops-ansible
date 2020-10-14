
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




##  iptraf-ng
