fusermount -u /home/esgi/COFFRE
cryptsetup luksClose /dev/mapper/COFFRE && umount -v /home/esgi/COFFRE
