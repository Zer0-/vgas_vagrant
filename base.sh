apt-get update
apt-get -y install\
    apache2\
    php5\
    libapache2-mod-php5\
    php5-mysql\
    git

cat <<EOF > /etc/apache2/sites-available/vga
<VirtualHost *:80>
	DocumentRoot /home/vagrant/www
	<Directory />
		Options FollowSymLinks
		AllowOverride None
	</Directory>
	<Directory /home/vagrant/www/>
		Options Indexes FollowSymLinks MultiViews
		AllowOverride All
		Order allow,deny
		allow from all
	</Directory>

	ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
	<Directory "/usr/lib/cgi-bin">
		AllowOverride None
		Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
		Order allow,deny
		Allow from all
	</Directory>

	ErrorLog \${APACHE_LOG_DIR}/vga_error.log

	# Possible values include: debug, info, notice, warn, error, crit,
	# alert, emerg.
	LogLevel warn

	CustomLog \${APACHE_LOG_DIR}/vga_access.log combined

    Alias /doc/ "/usr/share/doc/"
    <Directory "/usr/share/doc/">
        Options Indexes MultiViews FollowSymLinks
        AllowOverride None
        Order deny,allow
        Deny from all
        Allow from 127.0.0.0/255.0.0.0 ::1/128
    </Directory>

</VirtualHost>
EOF

AS_USER_SCRIPT=$( cat <<EOF
    cd;
    git clone https://github.com/clamburger/vidya-gaem-awards.git www;
    cd www;
    cp /vagrant/config.php includes;
EOF
)

rm /etc/apache2/sites-enabled/*
ln -s /etc/apache2/sites-available/vga /etc/apache2/sites-enabled/vga
a2enmod rewrite
service apache2 restart
su - vagrant -c "$AS_USER_SCRIPT"
