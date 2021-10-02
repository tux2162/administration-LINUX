################
##installation##
################

apt update -y && apt upgrade -y
apt install dropbear nginx php php-fpm mariadb-server php-mysql fail2ban -y

###############
#configuration#
###############

#dropbear
sed -i "s/DROPBEAR_OPTIONS=/DROPBEAR_OPTIONS='-I 180 -j -k -p 2222 -s'/g " /etc/dropbear-initramfs/config
#-I 180 : Disconnect the session if no traffic is transmitted or received in 180 seconds.
#-j : Disable ssh local port forwarding.
#-k : Also disable remote port forwarding.
#-p 2222 : Listen Dropbear ssh server on specified address and TCP port. If just a port such as 2222 
#is given listen on all addresses. up to 10 can be specified (default 22 if none specified).


#mariadb
#nginx
#bookstack