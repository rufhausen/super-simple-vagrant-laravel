#!/usr/bin/env bash

# Update the box
# --------------
# Downloads the package lists from the repositories
# and "updates" them to get information on the newest
# versions of packages and their dependencies

#FIRST RUN STUFF

apt-get update
apt-get install -y apache2
apt-get install php5
apt-get install -y libapache2-mod-php5
apt-get install -y php5-cli
apt-get install -y php5-mysql
apt-get install -y php5-curl
apt-get install -y php5-mcrypt
apt-get install php5-dev
sudo apt-get install php-apc
apt-get install make
apt-get install -y curl
curl -s https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
export DEBIAN_FRONTEND=noninteractive
apt-get -q -y install mysql-server-5.5
apt-get install -y git
apt-get install zsh

#END FIRST RUN STUFF

# Remove /var/www default
rm -rf /var/www
# Symlink /vagrant to /var/www
ln -fs /vagrant /var/www

# Add ServerName to httpd.conf
echo "ServerName localhost" > /etc/apache2/httpd.conf
# Setup hosts file
VHOST=$(cat <<EOF
<VirtualHost *:80>
  DocumentRoot "/vagrant/public"
  ServerName localhost
  <Directory "/vagrant/public">
    AllowOverride All
  </Directory>
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-enabled/000-default
# Enable mod_rewrite
a2enmod rewrite
# Restart apache
service apache2 restart
