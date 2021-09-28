# Modification du prompt
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
