#!/bin/bash
# set -e

apt install sudo -y
sudo apt install figlet
clear

sleep 2
figlet Suppression des packages inutiles
### Supprimer tous les packages inutiles installés au départ
sudo apt autoremove --purge
sudo apt remove -y telnet
sudo apt remove -y task-laptop

sleep 2
clear

figlet Installation des packages utiles en prod
sleep 2

### Installer tous les packages utiles sur sur un serveur de prod
apt install vim rsync screen mlocate btrfs-progs htop net-tools git tree gnupg2 mc psmisc lynx curl git cryptsetup pigz pixz zip ncdu iptraf iotop dstat gdisk mc cifs-utils ntfs-3g sshfs gdisk lshw inxi figlet screenfetch php php-fpm nginx mariadb-server -y

clear

figlet Generation cles ED25519
### Générer automatiquement les clés ED25519
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_root -C root
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_esgi -C esgi
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_davy -C davy

sleep 2
clear

figlet Synchronisation horaire Chronyd

### Synchronisation horaire
apt-get install chrony -y
systemctl status chronyd
echo "server 0.fr.pool.ntp.org iburst" >> /etc/chrony/chrony.conf
echo "server 1.fr.pool.ntp.org iburst" >> /etc/chrony/chrony.conf
echo "server 2.fr.pool.ntp.org iburst" >> /etc/chrony/chrony.conf
echo "server 3.fr.pool.ntp.org iburst" >> /etc/chrony/chrony.conf
# Config du prof
# echo "Synchronisation horaire";echo
##ntpdate pool.ntp.org
# timedatectl set-ntp on
# systemctl restart systemd-timesyncd
# systemctl status systemd-tymesyncd --no-pager

sleep 2
clear

figlet Creation du coffre
#COFFRE
#mot de passe du coffre = YES
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

### Mettre en place la configuration réseau statique 
# A FAIRE !!!!!

### Mettre les fichiers de configs comme .bashrc, issue.net et motd
# A FAIRE !!!!!

figlet Vider le cache des packages
### Vider le cache des packages DEBIAN 
apt-get clean

sleep 2
clear

figlet Customization du shell
### Customization 
# >> Modification du prompt pour le root
echo "PS1='\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\n\[\e[0;93m\]\u\[\e[0m\]@\[\e[0;91m\]\h\n\[\e[0;38;5;246m\]\d\[\e[0m\] - \[\e[0;38;5;245m\]\t\n\[\e[0m\]Répertoire de travail : \[\e[0m\]\w\n\[\e[0m\]Version Bash : \[\e[0m\]\v\n\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\n\[\e[0m\]\W\[\e[0m\] \[\e[0m\]>\[\e[0m\] \[\e[0m\]'" >> /root/.bashrc

# Création d'alias
echo 'alias umount="umount -flu"' >> /root/.bashrc
echo "alias chmod='chmod -v --preserve-root'" >> /root/.bashrc
echo "alias rm='rm -iv --preserve-root'" >> /root/.bashrc
echo "alias chown='chown -v --preserve-root'" >> /root/.bashrc
echo "alias mount='mount -v'" >> /root/.bashrc
echo "alias mv='mv -iv'" >> /root/.bashrc
echo "alias cp='cp -iv'" >> /root/.bashrc
echo "alias ll='ls -rtl --color'" >> /root/.bashrc
echo "alias lla='ll -a'" >> /root/.bashrc
echo "alias grep='grep --color=auto'" >> /root/.bashrc

# Chargement de la modification
source /root/.bashrc

# Modification du prompt
echo "PS1='\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\n\[\e[0;93m\]\u\[\e[0m\]@\[\e[0;91m\]\h\n\[\e[0;38;5;246m\]\d\[\e[0m\] - \[\e[0;38;5;245m\]\t\n\[\e[0m\]Répertoire de travail : \[\e[0m\]\w\n\[\e[0m\]Version Bash : \[\e[0m\]\v\n\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\[\e[0m\]#\n\[\e[0m\]\W\[\e[0m\] \[\e[0m\]>\[\e[0m\] \[\e[0m\]'" >> ~/.bashrc

# Création d'alias
echo 'alias umount="umount -flu"' >> ~/.bashrc
echo "alias chmod='chmod -v --preserve-root'" >> ~/.bashrc
echo "alias rm='rm -iv --preserve-root'" >> ~/.bashrc
echo "alias chown='chown -v --preserve-root'" >> ~/.bashrc
echo "alias mount='mount -v'" >> ~/.bashrc
echo "alias mv='mv -iv'" >> ~/.bashrc
echo "alias cp='cp -iv'" >> ~/.bashrc
echo "alias ll='ls -rtl --color'" >> ~/.bashrc
echo "alias lla='ll -a'" >> ~/.bashrc
echo "alias grep='grep --color=auto'" >> ~/.bashrc

# Chargement de la modification
source ~/.bashrc

sleep 2
clear

figlet Changement de la resolution

# Modification de la résolution
sed -i s/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=1920x1080/g /etc/default/grub
update-grub

sleep 2
clear

figlet Modification du Hostname et domaine
# Modification du hostname
echo "wiki" > /etc/hostname

# Modification du hosts pour le domain
sed -i 's/localhost/esgi.local/g' /etc/hosts
variable = $(hostname -f)
sed -i 's/$variable/esgi.local/g' /etc/hosts

#modification du domainame
sed -i 's/localdomain/wiki.esgi.local/g' /etc/resolv.conf

sleep 2
clear

### Ajouter un user "ESGI" pouvoir root non chrooté, password:P@ssword, UID:10000, GID:10000
# A FAIRE !!!!

figlet Securisation du Grub

### Sécurisation du GRUB, création d'un compte root:root password en pbkdf2
mdp=$(echo -e 'root\nroot' |grub-mkpasswd-pbkdf2|grep hachage|cut -d" " -f9)
echo "cat << EOF" >> /etc/grub.d/00_header
echo 'set superusers="root"' >> /etc/grub.d/00_header
echo "password_pbkdf2 root $mdp" >> /etc/grub.d/00_header
echo "EOF" >> /etc/grub.d/00_header
update-grub

sleep 2
clear

figlet Desactivation option advance
# Désactivé option avancé du GRUB
echo 'GRUB_DISABLE_RECOVERY="true"' >> /etc/default/grub
echo 'GRUB_DISABLE_SUBMENU=y' >> /etc/default/grub
update-grub

sleep 2
clear

echo "Reboot dans 3 secondes"
sleep 3
reboot



