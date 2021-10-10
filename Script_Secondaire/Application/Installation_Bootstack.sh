#!bin/bash
#test
##installation de Bootstack
#miseEnplaceDeMariaDB
apt install mariadb-server nginx  php-fpm php-mbstring php-gd php-tokenizer php-mysql php-curl composer git    -y
sleep 1
echo -e "y\n y\n test\n test\n y\n y\n y\n y\n" | mysql_secure_installation
sleep 1
mysql -e "CREATE DATABASE IF NOT EXISTS bookstackdb  "
mysql -e "CREATE USER 'bookstackuser'@'localhost' IDENTIFIED BY 'password';"
mysql -e "GRANT ALL PRIVILEGES ON * . * TO 'bookstackuser'@'localhost';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'abc';"
mysql -uroot -pabc -e  "grant all on bookstackdb.* to 'bookstackuser'@'localhost' identified by 'password';;"
mysql -uroot -pabc -e "FLUSH PRIVILEGES;"

#service mariadb stop
#sleep 2
#Déplacement des fichiers du SGBD vers le coffre
#cp -r /var/lib/mysql /home/esgi/COFFRE/SERVEUR/DEBIAN10/APPLIS/
#mv /var/lib/mysql /var/lib/mysql.back
#chown -R mysql:mysql /home/esgi/COFFRE/SERVEUR/DEBIAN10/APPLIS/mysql
#sed -i "s#/var/lib/mysql#/home/esgi/COFFRE/SERVEUR/APPLIS/DEBIAN10/APPLIS/mysql#" /etc/mysql/mariadb.conf.d/50-server.cnf
#sed -i "s/ProtectHome=true/ProtectHome=false/" /etc/systemd/system/multi-user.target.wants/mariadb.service
#sed -i "s/ProtectHome=true/ProtectHome=false/" /usr/lib/systemd/system/mariadb.service
#sed -i "s/ProtectHome=true/ProtectHome=false/" /lib/systemd/system/mariadb.service
#service mariadb reload
#service mariadb restart
apt install mariadb-server nginx  php-fpm php-mbstring php-gd php-tokenizer php-mysql php-curl composer git    -y

mkdir /var/www/bookstack
cd /var/www/bookstack
git clone https://github.com/BookStackApp/BookStack.git --branch release --single-branc
cd BookStack
cp /var/www/bookstack/BookStack/.env.example  /var/www/bookstack/BookStack/.env
sed -i 's$APP_URL=https://example.com$APP_URL=https://wiki.esgi/local$g' .env
sleep 1
sed -i 's$DB_HOST=localhost$DB_HOST=localhost$g' .env
sed -i 's$DB_DATABASE=database_database$DB_DATABASE=bookstackdb$g' .env
sed -i 's$DB_USERNAME=database_username$DB_USERNAME=bookstackuser$g' .env
sed -i 's$DB_PASSWORD=database_user_password$DB_PASSWORD=password$g' .env
echo -e "yes" |composer install --no-dev
echo -e "yes" |php artisan key:generate
echo -e "yes" |php artisan migrate


#mv /home/esgi/COFFRE/SERVEUR/DEBIAN10/APPLIS/mysql/mysql var/lib/mysql
