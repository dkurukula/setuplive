#!/bin/bash

sudo apt remove -y --purge libreoffice* thunderbird ubuntu-web-launchers
sudo apt-get clean -y
sudo apt-get autoremove -y

new="set -o vi \n"
file=~/.bashrc
sed -i "4s/$/$new/" $file

source $file

sudo timedatectl set-timezone US/Eastern
gsettings set org.gnome.desktop.interface clock-format '12h'   


sudo apt update
sudo apt install -y software-properties-common apt-transport-https git curl 

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install nodejs


wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code 

npm install -g expo-cli
