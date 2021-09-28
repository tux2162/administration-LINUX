# Modification de la résolution en 1920x1000
sed -i s/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=1920x1080/g /etc/default/grub
update-grub
