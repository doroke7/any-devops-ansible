# https://certbot.eff.org/lets-encrypt/centosrhel7-nginx



sudo yum install certbot python2-certbot-nginx
sudo certbot --nginx
sudo certbot certonly --nginx
sudo certbot renew -q
