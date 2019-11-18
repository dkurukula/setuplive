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

#update and upgrade only if not already done today
[ -z "$(find -H /var/lib/apt/lists -maxdepth 0 -mtime -1)" ] && sudo apt update && apt upgrade


sudo apt install -y zsh

NEWDIR=~/.oh-my-zsh
if [ ! -d "$NEWDIR" ]; then
	git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc chsh -s /bin/zsh
fi

NEWDIR=$HOME/.zsh-syntax-highlighting
if [ ! -d "$NEWDIR" ]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1
fi

NEWFILE=$HOME/.zshrc
if [ ! -f "$NEWFILE" ]; then
	echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"
fi
