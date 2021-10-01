apt install -y build-essential libcairo2-dev libjpeg62-turbo-dev \
libpng-dev libtool-bin libossp-uuid-dev libavutil-dev libswscale-dev \
freerdp2-dev libpango1.0-dev libssh2-1-dev libvncserver-dev libtelnet-dev \
libwebsockets-dev libssl-dev libvorbis-dev libwebp-dev libpulse-dev sudo vim

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

apt install ufw

ufw allow 8080/tcp

mkdir /etc/guacamole

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

ln -s /etc/guacamole /usr/share/tomcat9/.guacamole

cat > /etc/guacamole/user-mapping.xml << EOL
<user-mapping>
        
    <!-- Per-user authentication and config information -->

    <!-- A user using md5 to hash the password
         guacadmin user and its md5 hashed password below is used to 
             login to Guacamole Web UI-->
    <authorize 
            username="guacadmin"
            password="5f4dcc3b5aa765d61d8327deb882cf99"
            encoding="md5">

        <!-- First authorized Remote connection -->
        <connection name="Rocky Linux 8 Server SSH">
            <protocol>ssh</protocol>
            <param name="hostname">192.168.60.19</param>
            <param name="port">22</param>
        </connection>

        <!-- Second authorized remote connection -->
        <connection name="Windows 7 RDP">
            <protocol>rdp</protocol>
            <param name="hostname">192.168.56.122</param>
            <param name="port">3389</param>
            <param name="username">koromicha</param>
            <param name="ignore-cert">true</param>
        </connection>

    </authorize>

</user-mapping>

EOL

systemctl restart tomcat9 guacd