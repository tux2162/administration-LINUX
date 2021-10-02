useradd "esgi"
echo -e 'P@ssword\nP@ssword'|passwd "esgi"
usermod -u 10000 esgi
groupmod -g 10000 esgi
