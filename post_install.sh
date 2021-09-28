#modification du hostname
echo "esgi" > /etc/hostname

#modification du hosts pour le domain
#sed -i 's/old_word/new_word'

#boucle à rajouter pour faire les modification en une fois
sed -i 's/localhost/esgi.local/g' /etc/hosts
variable = $(hostname -f)
sed -i 's/$variable/esgi.local/g' /etc/hosts
