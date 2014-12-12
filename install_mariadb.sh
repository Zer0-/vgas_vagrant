ROOT_DB_PWD="vagrant"
apt-get update

apt-get -y install software-properties-common
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
add-apt-repository 'deb http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.0/ubuntu trusty main'
apt-get update

export DEBIAN_FRONTEND=noninteractive
debconf-set-selections <<< "mariadb-server-10.0 mysql-server/root_password password $ROOT_DB_PWD"
debconf-set-selections <<< "mariadb-server-10.0 mysql-server/root_password_again password $ROOT_DB_PWD"
apt-get -y install mariadb-server mariadb-client

mysql -u root --password=$ROOT_DB_PWD < /vagrant/admindb.sql
mysql -u vagrant --password=vagrant vidya < /home/vagrant/www/database_schema.sql || true
mysql -u vagrant --password=vagrant vidya < /home/vagrant/www/database_data.sql || true
