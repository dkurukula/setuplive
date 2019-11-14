#!/bin/bash

sudo apt remove -y --purge libreoffice* thunderbird ubuntu-web-launchers tiny-vim
sudo apt-get clean -y
sudo apt-get autoremove -y

new="set -o vi \n"
file=~/.bashrc
sudo sed -i "4s/$/$new/" $file
source $file

file=/etc/apt/sources.list	
sudo sed -i "s/restricted/universe/g" $file
source $file

sudo timedatectl set-timezone US/Eastern
gsettings set org.gnome.desktop.interface clock-format '12h'   


sudo apt update
sudo apt install -y software-properties-common apt-transport-https git curl python3-pip vim

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

