### Script pour Debian 11 - Guacamole 1.3.0
### Pensez à changer l'IP par celle de votre machine
### Port par défault : 8080
### Lien final : http://<IP>:<PORT>/Guacamole
### Log par défaut : root:root
### Auteur : Léo - Vincent

# Installation des paquets nécessaires
apt install -y build-essential libcairo2-dev libjpeg62-turbo-dev \
libpng-dev libtool-bin libossp-uuid-dev libavutil-dev libswscale-dev \
freerdp2-dev libpango1.0-dev libssh2-1-dev libvncserver-dev libtelnet-dev \
libwebsockets-dev libssl-dev libvorbis-dev libwebp-dev libpulse-dev sudo vim

# Téléchargement/installation guacamole server
wget https://downloads.apache.org/guacamole/1.3.0/source/guacamole-server-1.3.0.tar.gz
tar xzf guacamole-server-1.3.0.tar.gz
cd guacamole-server-1.3.0
./configure --with-systemd-dir=/etc/systemd/system/
make
make install
ldconfig
systemctl daemon-reload
systemctl enable --now guacd
systemctl status guacd

apt install tomcat9 tomcat9-admin tomcat9-common tomcat9-user -y

apt install ufw -y
ufw allow 8080/tcp
mkdir /etc/guacamole

# Guacamole client
wget https://downloads.apache.org/guacamole/1.3.0/binary/guacamole-1.3.0.war -O /etc/guacamole/guacamole.war
ln -s /etc/guacamole/guacamole.war /var/lib/tomcat9/webapps/
systemctl restart tomcat9 guacd
mkdir /etc/guacamole/{extensions,lib}
systemctl daemon-reload
systemctl restart guacd
echo "GUACAMOLE_HOME=/etc/guacamole" >> /etc/default/tomcat9
cat > /etc/guacamole/guacamole.properties << EOL
guacd-hostname: localhost
guacd-port: 4822
user-mapping:   /etc/guacamole/user-mapping.xml
auth-provider:  net.sourceforge.guacamole.net.basic.BasicFileAuthenticationProvider
EOL

# Configuration, remplacer l'IP par celle de la machine
ln -s /etc/guacamole /usr/share/tomcat9/.guacamole
cat > /etc/guacamole/user-mapping.xml << EOL
<user-mapping>
        
    <!-- Per-user authentication and config information -->

    <!-- A user using md5 to hash the password
         guacadmin user and its md5 hashed password below is used to 
             login to Guacamole Web UI-->
    <authorize 
            username="root"
            password="63a9f0ea7bb98050796b649e85481845"
            encoding="md5">

        <!-- First authorized Remote connection -->
        <connection name="Debian 11">
            <protocol>ssh</protocol>
            <param name="hostname">192.168.60.19</param>
            <param name="port">22</param>
        </connection>


    </authorize>

</user-mapping>

EOL
systemctl restart tomcat9 guacd
