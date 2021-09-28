mdp=$(echo -e 'root\nroot' |grub-mkpasswd-pbkdf2|grep hachage|cut -d" " -f9)
echo "cat << EOF" >> /etc/grub.d/00_header
echo 'set superusers="root"' >> /etc/grub.d/00_header
echo "password_pbkdf2 root $mdp" >> /etc/grub.d/00_header
echo "EOF" >> /etc/grub.d/00_header
echo 'GRUB_DISABLE_RECOVERY="true"' >> /etc/default/grub
echo 'GRUB_DISABLE_SUBMENU=y' >> /etc/default/grubi
update-grub

