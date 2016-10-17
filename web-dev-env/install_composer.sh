#!/bin/bash
# https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md
set -euo pipefail
IFS=$'\n\t'

# Script will auto terminate on errors
# run like - bash script_name.sh

# Prevent source
[[ "${BASH_SOURCE[0]}" != "${0}" ]] && echo -e "\e[91m This script is being sourced, will exit now \e[39m" && return

# Composer requires php v5.3.2 pre-installed
# Download composer 
echo -e "\e[96m Downloading and installing composer.phar \e[39m"
# Notice: Still using the good old way
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Check composer version
composer --version
