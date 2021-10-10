echo -e 'YES\n' |cryptsetup luksOpen /dev/VGCRYPT/lv_coffre COFFRE
mount -v /dev/mapper/COFFRE /home/esgi/COFFRE
var="$(ps aux |grep mariadb|grep mysql|cut -c1-5)"
if [ $var != "mysql" ]; then
	 
		service mariadb start
fi

