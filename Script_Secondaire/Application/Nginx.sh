sudo apt install curl gnupg2 ca-certificates lsb-release -y
sudo apt install nginx -y
sudo systemctl start nginx
# Mettre Nginx au démarrage
sudo systemctl enable nginx
