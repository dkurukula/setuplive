#!/bin/bash

sudo apt-get remove -y --purge libreoffice*
sudo apt-get clean -y
sudo apt-get autoremove -y

new="set -o vi \n"
file=~/.bashrc
sed -i "4s/$/$new/" $file

source $file

