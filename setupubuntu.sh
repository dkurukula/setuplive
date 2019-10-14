#!/bin/bash

sudo apt-get remove -y --purge libreoffice* thunderbird ubuntu-web-launchers
sudo apt-get clean -y
sudo apt-get autoremove -y

new="set -o vi \n"
file=~/.bashrc
sed -i "4s/$/$new/" $file

source $file

sudo timedatectl set-timezone US/Eastern
gsettings set org.gnome.desktop.interface clock-format '12h'   
