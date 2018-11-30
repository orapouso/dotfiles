#!/bin/bash

# disable sudo password timeout
sudo sh -c 'echo "\nDefaults timestamp_timeout=-1" >> /etc/sudoers'

sudo sh -c "echo 'deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe' >> /etc/apt/sources.list.d/i3.list"
sudo apt --allow-unauthenticated install sur5r-keyring

sudo apt update

# setting msfonts default eula
echo 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true' | sudo debconf-set-selections

# setting mysql root password
echo 'steam steam/question select I AGREE' | sudo debconf-set-selections
echo 'steam steam/licence note ' | sudo debconf-set-selections

 general
sudo apt install -y \
	chromium-browser \
	vim vlc \
	easytag \
	cifs-utils \
	ubuntu-restricted-extras \
	variety xss-lock \
	arandr

# desktop
sudo apt install -y \
	i3 zsh feh \
	rofi \
	xbacklight \
	youtube-viewer

# dev
sudo apt install -y \
	git gitg git-flow meld \
	mysql-workbench \
	python-software-properties \
	python-virtualenv
	python-pip

# visual studio code
sudo snap install --classic vscode

# spotify
sudo snap install spotify

# gaming
sudo apt install -y playonlinux steam lutris

# firefox developer
wget -O /tmp/firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US" \
	&& tar xvfj /tmp/firefox.tar.bz2 -C ~/Apps \
	&& sudo ln -s ~/Apps/firefox/firefox /usr/bin/firefox-developer

# google chrome
wget -P /tmp https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb

# hplip - hp printer driver
# download from http://hplipopensource.com/hplip-web/install/install/index.html

zsh

# zgen
git clone https://github.com/tarjoilija/zgen.git .zgen

sudo chsh -s /bin/zsh

# basher
git clone https://github.com/basherpm/basher.git ~/.basher
source ~/.zshrc

# nave.sh - Virtual Environments for Node
basher install isaacs/nave
nave install stable
sudo env "PATH=$PATH" nave usemain stable

ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.Xresources ~/.Xresources
ln -s ~/dotfiles/i3/config ~/.config/i3/config
ln -s ~/dotfiles/polybar/config ~/.config/polybar/config
ln -s ~/dotfiles/variety/variety.conf ~/.config/variety/variety.conf
sudo ln -s ~/dotfiles/gnome-sound-panel.desktop /usr/share/applications/gnome-sound-panel.desktop

# re-enable sudo password timeout
sudo sed -i "/Defaults timestamp_timeout=-1/d" /etc/sudoers
