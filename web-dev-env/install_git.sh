#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Script will auto terminate on errors
# run like - bash script_name.sh
# Author: ankurk91


# Prevent source
[[ "${BASH_SOURCE[0]}" != "${0}" ]] && echo -e "\e[91m This script is being sourced, will exit now \e[39m" && return


# Install latest git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get -y install git

# My Git Configs
git config --global --add merge.ff false
git config --global push.followTags true
git config --global core.autocrlf false
git config --global push.default simple
git config --global color.ui auto
git config --global branch.autosetuprebase always
git config --global core.compression 9
git config --global credential.helper 'cache --timeout 28800'
git config --global core.filemode false

git config --global alias.st status
git config --global alias.co checkout

# Clean up
sudo apt-get clean

# Check for git version
git --version
