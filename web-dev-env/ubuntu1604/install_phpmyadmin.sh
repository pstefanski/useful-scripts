#!/bin/bash
# Script will auto terminate on errors
set -euo pipefail
IFS=$'\n\t'

# Ubuntu 16.04, apache2.4
# Don't source it, run like - bash install_phpmyadmin.sh
# You should have MySQL pre-installed

# Prevent source
[[ "${BASH_SOURCE[0]}" != "${0}" ]] && echo -e "\e[91m This script is being sourced, will exit now \e[39m" && return


echo -e "\e[96m Begin silent install phpMyAdmin \e[39m"

# Add phpMyAdmin PPA for latest version
sudo add-apt-repository -y ppa:nijel/phpmyadmin
sudo apt-get update

echo -e "\e[93m User: root, Password: root \e[39m"
# Set non-interactive mode
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/dbconfig-install boolean true'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/app-password-confirm password root'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/admin-pass password root'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/app-pass password root'
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2'﻿

sudo apt-get -y install phpmyadmin

# Restart apache server
sudo service apache2 restart

# Clean up
sudo apt-get clean

echo -e "\e[92m phpMyAdmin installed successfully \e[39m"
