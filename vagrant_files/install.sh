#!/bin/bash

sudo apt-get update
sudo apt-get install -y nginx php7.0 php7.0-mysql mariadb-server expect git

NEW_MYSQL_PASSWORD='mypasswd'

SECURE_MYSQL=$(expect -c "
set timeout 3
spawn mysql_secure_installation
expect \"Enter current password for root (enter for none):\"
send \"\r\"
expect \"root password?\"
send \"y\r\"
expect \"New password:\"
send \"$NEW_MYSQL_PASSWORD\r\"
expect \"Re-enter new password:\"
send \"$NEW_MYSQL_PASSWORD\r\"
expect \"Remove anonymous users?\"
send \"y\r\"
expect \"Disallow root login remotely?\"
send \"y\r\"
expect \"Remove test database and access to it?\"
send \"y\r\"
expect \"Reload privilege tables now?\"
send \"y\r\"
expect eof
")

sudo echo "${SECURE_MYSQL}"

sudo apt-get purge -y expect

sudo cp /vagrant/vagrant_files/nginx-php /etc/nginx/sites-available/default
sudo cp /vagrant/vagrant_files/index.php /var/www/html/

sudo /etc/init.d/nginx restart
