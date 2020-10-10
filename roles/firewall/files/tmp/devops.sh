# 列出所有的區域
firewall-cmd --get-zones

# 列出所有的區域與內容
sudo firewall-cmd --list-all-zones

# 列出預設區域
firewall-cmd --get-default-zone

# 設定預設區域
firewall-cmd --set-default-zone=public

# 查詢網路介面所屬區域
firewall-cmd --get-zone-of-interface=enp7s0d1

# 列出 public 區域永久的服務設定值
sudo firewall-cmd --zone=public --permanent --list-services


firewall-cmd --get-active-zones  # 查看区域信息


firewall-cmd --zone=public --list-all


firewall-cmd --reload # 更新防火墙规则


firewall-cmd --permanent --remove-source=192.168.1.100