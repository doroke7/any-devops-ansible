# https://certbot.eff.org/lets-encrypt/centosrhel7-nginx



sudo yum install certbot python2-certbot-nginx
sudo certbot --nginx
sudo certbot certonly --nginx
sudo certbot renew -q


# 定时 renew ssl key
00 05 01 * * sudo /usr/bin/certbot renew --quiet && sudo /bin/systemctl restart nginx
