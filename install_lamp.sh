#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Ubuntu 16.04 Dev Server
# Don't source it, run like - bash install_lamp.sh
# Script will auto terminate on errors
# Author: ankurk91


# Prevent source
[[ "${BASH_SOURCE[0]}" != "${0}" ]] && echo -e "\e[91m This script is being sourced, will exit now \e[39m" && return


# Update indexes (optional)
sudo apt-get update

echo -e "\e[96m Install apache  \e[39m"
sudo apt-get -y install apache2

echo -e "\e[96m Install php  \e[39m"
sudo apt-get -y install php7.0 libapache2-mod-php7.0 

# Enable php exts
sudo apt-get -y install mcrypt php7.0-mysql php7.0-mcrypt php7.0-curl php7.0-json php7.0-mbstring php7.0-gd php7.0-intl php-gettext php-xdebug
sudo phpenmod mcrypt
sudo phpenmod curl

# Enable some apache modules
sudo a2enmod rewrite
#sudo a2enmod headers

echo -e "\e[96m Restart apache server to reflect changes  \e[39m"
sudo service apache2 restart

echo -e "\e[96m Install mysql server \e[39m"
echo -e "\e[93m User: root, Password: root \e[39m"

# Install MySQL Server in a Non-Interactive mode. Default root password will be "root"
echo "mysql-server-5.7 mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server-5.7 mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get -y install mysql-server-5.7

### Run next command on production server
#sudo mysql_secure_installation

# Check php version
php -v

# Check apache version
apachectl -v

# Check mysql version
mysql --version

# Check if php is working or not
php -r 'echo "\nIt means your PHP installation is working fine.\n";'

echo -e "\e[92m Open http://localhost/ to check if apache is working or not. \e[39m"

# Clean up cache
sudo apt-get clean
