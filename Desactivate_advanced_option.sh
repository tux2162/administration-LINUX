#Désactiver option avancé
#test
echo 'GRUB_DISABLE_RECOVERY="true"' >> /etc/default/grub
echo 'GRUB_DISABLE_SUBMENU=y' >> /etc/default/grub
update-grub
