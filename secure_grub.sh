# Création du mdp, modifier "root\nroot" par le password souhaité
#test
mdp=$(echo -e 'root\nroot' |grub-mkpasswd-pbkdf2|grep hachage|cut -d" " -f9)

# Modification du fichier, modifier "root" par le nom d'utilisateur souhaité
echo "cat << EOF" >> /etc/grub.d/00_header
echo 'set superusers="root"' >> /etc/grub.d/00_header
echo "password_pbkdf2 root $mdp" >> /etc/grub.d/00_header
echo "EOF" >> /etc/grub.d/00_header
update-grub

