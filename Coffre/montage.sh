lvcreate -L 2GB -n lv_coffre VGCRYPT
echo -e 'YES\n' |cryptsetup luksFormat /dev/VGCRYPT/lv_coffre
echo -e 'YES\n' |cryptsetup luksOpen /dev/VGCRYPT/lv_coffre COFFRE
mkdir /home/esgi/COFFRE
mkfs.btrfs  /dev/mapper/COFFRE
mount -v /dev/mapper/COFFRE /home/esgi/COFFRE
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
