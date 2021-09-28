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
