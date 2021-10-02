var="$(ps aux |grep mariadb|grep mysql|cut -c1-5)"
if [ "$var" == "mysql" ]; then
		
		service mariadb stop
fi
fusermount -u /home/esgi/COFFRE
cryptsetup luksClose /dev/mapper/COFFRE 



