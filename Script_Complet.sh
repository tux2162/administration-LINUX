#!/bin/bash
#test
set -e

### Supprimer tous les packages inutiles installés au départ
sudo apt autoremove --purge
sudo apt remove -y telnet
sudo apt remove -y task-laptop

### Installer tous les packages utiles sur sur un serveur de prod
apt install vim rsync screen mlocate htop net-tools git update-grub tree gnupg2 mc psmisc lynx curl git pigz pixz zip ncdu iptraf iotop dstat gdisk mc cifs-utils ntfs-3g sshfs gdisk lshw inxi figlet screenfetch

### Générer automatiquement les clés ED25519
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_root -C root
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_esgi -C esgi
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_davy -C davy

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
# systemctl status systemd-tymesyncd

### Mettre en place la configuration réseau statique 
# A FAIRE !!!!!

### Mettre les fichiers de configs comme .bashrc, issue.net et motd
# A FAIRE !!!!!

### Vider le cache des packages DEBIAN 
apt-get clean

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

# Modification de la résolution
sed -i s/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=1920x1080/g /etc/default/grub
update-grub

# Modification du hostname
echo "wiki" > /etc/hostname

# Modification du hosts pour le domain
sed -i 's/localhost/esgi.local/g' /etc/hosts
variable = $(hostname -f)
sed -i 's/$variable/esgi.local/g' /etc/hosts

#modification du domainame
sed -i 's/localdomain/wiki.esgi.local/g' /etc/resolv.conf

### Ajouter un user "ESGI" pouvoir root non chrooté, password:P@ssword, UID:10000, GID:10000
# A FAIRE !!!!


### Sécurisation du GRUB, création d'un compte root:root password en pbkdf2
mdp=$(echo -e 'root\nroot' |grub-mkpasswd-pbkdf2|grep hachage|cut -d" " -f9)
echo "cat << EOF" >> /etc/grub.d/00_header
echo 'set superusers="root"' >> /etc/grub.d/00_header
echo "password_pbkdf2 root $mdp" >> /etc/grub.d/00_header
echo "EOF" >> /etc/grub.d/00_header
update-grub

# Désactivé option avancé du GRUB
echo 'GRUB_DISABLE_RECOVERY="true"' >> /etc/default/grub
echo 'GRUB_DISABLE_SUBMENU=y' >> /etc/default/grub
update-grub


