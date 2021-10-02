# Installation nginx
sudo apt install curl gnupg2 ca-certificates lsb-release -y
sudo apt install nginx -y
sudo systemctl start nginx
# Mettre Nginx au démarrage
sudo systemctl enable nginx

# Creation certificat
mkdir /etc/nginx/certificats
echo -e '\n\n\n\n\n\n\n\' |sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certificats/wiki.esgi.local.key -out /etc/nginx/certificats/wiki.esgi.local.crt
echo 'ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;' >> /etc/nginx/snippets/self-signed.conf
echo 'ssl_protocols TLSv1.2;
ssl_prefer_server_ciphers on;
ssl_dhparam /etc/nginx/dhparam.pem;
ssl_ciphers ECDHE-RSA-AES256-GCM-SHA512:DHE-RSA-AES256-GCM-SHA512:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-SHA384;
ssl_ecdh_curve secp384r1; # Requires nginx >= 1.1.0
ssl_session_timeout  10m;
ssl_session_cache shared:SSL:10m;
ssl_session_tickets off; # Requires nginx >= 1.5.9
ssl_stapling on; # Requires nginx >= 1.3.7
ssl_stapling_verify on; # Requires nginx => 1.3.7
resolver 8.8.8.8 8.8.4.4 valid=300s;
resolver_timeout 5s;
# Disable strict transport security for now. You can uncomment the following
# line if you understand the implications.
# add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload";
add_header X-Frame-Options DENY;
add_header X-Content-Type-Options nosniff;
add_header X-XSS-Protection "1; mode=block";' >> /etc/nginx/snippets/ssl-params.conf



# Redémarrage nginx
sudo systemctl restart nginx
