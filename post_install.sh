#modification du hostname
echo "wiki" > /etc/hostname

#modification du hosts pour le domain
#sed -i 's/old_word/new_word'

#boucle à rajouter pour faire les modification en une fois
sed -i 's/localhost/esgi.local/g' /etc/hosts
variable = $(hostname -f)
sed -i 's/$variable/esgi.local/g' /etc/hosts
#modification du domainame
sed -i 's/localdomain/wiki.esgi.local/g' /etc/resolv.conf

#modification de dynamique à statique

