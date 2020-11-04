git reset HEAD

git checkout .  # 还原已追踪的档案

git clean -df   # 清除未追踪的档案

sudo yum install rng-tools

sudo service rngd start


#########################################################################

gpg --list-keys
gpg --list-secret-keys

gpg --delete-key         # 删除公钥 (跨号)里面的 id 
gpg --delete-secret-keys # 删除私钥 (跨号)里面的 id 

gpg --gen-key


## =======================  A1 电脑 迁移到 A2 电脑 的步骤 ============================

### 1. A1 电脑转出 公钥
gpg --export eddie222.diamond@gmail.com --armor > /var/www/any-devops-gpg/eddie222.diamond@gmail.com.public.gpg
### 2. A1 电脑转出 私钥
gpg --armor --export-secret-keys eddie222 > /var/www/any-devops-gpg/eddie222.diamond@gmail.com.private.gpg

### 3. A2 电脑转入 私钥
gpg --import /var/www/any-devops-gpg/eddie222.diamond@gmail.com.private.gpg

### 4. A2 电脑转入 公钥
gpg --import /var/www/any-devops-gpg/eddie222.diamond@gmail.com.public.gpg

### 5. 即可执行 git secret reveal 


##  ================================================================================


git secret tell eddie222.diamond@gmail.com


sudo git secret add keys/*
sudo git secret hide

git-secret reveal




#Add Users
# 1. 其他人转出 public key

# 2. 主要加密人 引入别人的 公钥
gpg --import key.txt
git-secret tell user@domain.com