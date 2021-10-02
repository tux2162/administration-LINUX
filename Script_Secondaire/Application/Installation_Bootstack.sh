#!bin/bash
#test
##installation de Bootstack
#miseEnplaceDeMariaDB
apt install mariadb-server -y
sleep 1
echo -e "y\n y\n test\n test\n y\n y\n y\n y\n" | mysql_secure_installation
sleep 1
mysql -e "CREATE DATABASE IF NOT EXISTS bookstackdb  "
mysql -e "CREATE USER 'bookstackuser'@'localhost' IDENTIFIED BY 'password';"
mysql -e "GRANT ALL PRIVILEGES ON * . * TO 'bookstackuser'@'localhost';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'abc';"
mysql -uroot -pabc -e "FLUSH PRIVILEGES;"
