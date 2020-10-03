# 列出所有的區域
firewall-cmd --get-zones

# 列出所有的區域與內容
sudo firewall-cmd --list-all-zones

# 列出預設區域
firewall-cmd --get-default-zone

# 設定預設區域
firewall-cmd --set-default-zone=home

# 查詢網路介面所屬區域
firewall-cmd --get-zone-of-interface=enp7s0d1

# 列出 public 區域永久的服務設定值
sudo firewall-cmd --zone=public --permanent --list-services