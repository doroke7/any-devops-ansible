# 0. Rsync Client 端 生成 ssh key pair, Rsync Server 端 在 /root/.ssh/authorized_keys 配置



# 0. 配置来源服务器 的 链接时间



# 1. 全量配置
rsync -av -e "ssh -p 15081" root@154.196.140.20:/var/www/shoushou_video_php/ shoushou_video_php 