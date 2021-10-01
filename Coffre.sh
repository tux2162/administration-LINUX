apt install cryptsetup btrfs-progs

figlet Creation du coffre
#COFFRE
#mot de passe du coffre = YES
lvcreate -L 2GB -n lv_coffre VGCRYPT
echo -e 'YES\n' |cryptsetup luksFormat /dev/VGCRYPT/lv_coffre
echo -e 'YES\n' |cryptsetup luksOpen /dev/VGCRYPT/lv_coffre COFFRE
mkdir /home/esgi/COFFRE
mkfs.btrfs  /dev/mapper/COFFRE
mount -v /dev/mapper/COFFRE /home/esgi/COFFRE
cryptsetup luksClose /dev/mapper/COFFRE && umount -v /home/esgi/COFFRE
sleep 1
mkdir /home/esgi/COFFRE/CERTIFICAT
mkdir /home/esgi/COFFRE/ENVIRONNEMENT
mkdir /home/esgi/COFFRE/ENVIRONNEMENT/bash
mkdir /home/esgi/COFFRE/ENVIRONNEMENT/ksh
mkdir /home/esgi/COFFRE/ENVIRONNEMENT/zsh
mkdir /home/esgi/COFFRE/MEMENTO
mkdir /home/esgi/COFFRE/SECURITE
mkdir /home/esgi/COFFRE/SECURITE/fail2ban
mkdir /home/esgi/COFFRE/SECURITE/firewall
mkdir /home/esgi/COFFRE/SECURITE/supervision
mkdir /home/esgi/COFFRE/SERVEUR
sleep 2


figlet Modification du fichier rc.local

cat <<EOF >/etc/rc.local
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

echo -e 'YES\n' |cryptsetup luksOpen /dev/VGCRYPT/lv_coffre COFFRE
mount -v /dev/mapper/COFFRE /home/esgi/COFFRE
exit 0

EOF
chmod +x /etc/rc.local
systemctl daemon-reload
systemctl start rc-local
systemctl status rc-local
