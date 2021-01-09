# Supervisor 体验并不好
# Supervisor 体验并不好
# Supervisor 体验并不好
# Supervisor 体验并不好
# Supervisor 体验并不好
# 每次 supervisorctl restart 之前 都要 reload 设定档

# Supervisor 体验并不好
# Supervisor 体验并不好
# Supervisor 体验并不好
# Supervisor 体验并不好
# Supervisor 体验并不好
# 每次 supervisorctl start 之前 都要 sudo service supervisord restart
sudo supervisorctl -c /etc/supervisord/supervisord.conf status


sudo supervisorctl reload;



# 关闭 supervisord
sudo supervisorctl shutdown;

# 进入 supervisord CLI 控制界面
sudo supervisorctl -c /etc/supervisord/supervisord.conf

# 进入 supervisord CLI 控制界面
sudo supervisorctl -c /etc/supervisord/supervisord.conf status

# 进入 supervisord CLI 控制界面  读取有更新（增加）的配置文件，不会启动新添加的程序
sudo supervisorctl -c /etc/supervisord/supervisord.conf reread

# 进入 supervisord CLI 控制界面  重启配置文件修改过的程序
sudo supervisorctl -c /etc/supervisord/supervisord.conf update


# 重启 lottery-service_resource_backend-lumen GROUP 所有 命令 #  【要加 冒号!!!!!】【要加 冒号!!!!!】【要加 冒号!!!!!】【要加 冒号!!!!!】 
sudo supervisorctl -c /etc/supervisord/supervisord.conf restart lottery-service_resource_backend-lumen:

# 重启 lottery-crawler_all_backend-sracpy GROUP 所有 命令 【要加 冒号!!!!!】【要加 冒号!!!!!】【要加 冒号!!!!!】【要加 冒号!!!!!】 
sudo supervisorctl -c /etc/supervisord/supervisord.conf restart lottery-crawler_all_backend-sracpy:



# 关闭 lottery-service_resource_backend-lumen php73_artisan_swoole_http_start
sudo supervisorctl -c /etc/supervisord/supervisord.conf stop lottery-service_resource_backend-lumen:php73_artisan_swoole_http_start

# 启动 lottery-service_resource_backend-lumen php73_artisan_swoole_http_start
sudo supervisorctl -c /etc/supervisord/supervisord.conf start lottery-service_resource_backend-lumen:php73_artisan_swoole_http_start


# 注意 supervisorctl (Supervisorctl CLI) 前提是要 supervisord 开启