#!/bin/bash

# disable sudo password timeout
sudo sh -c 'echo "\nDefaults timestamp_timeout=-1">>/etc/sudoers'

# sublime text 3
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3

sudo echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
sudo apt-get --allow-unauthenticated install sur5r-keyring

sudo apt-get update

# setting msfonts default eula
echo 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true' | sudo debconf-set-selections

# setting mysql root password
echo 'mysql-server mysql-server/root_password password rootroot' | sudo debconf-set-selections
echo 'mysql-server mysql-server/root_password_again password rootroot' | sudo debconf-set-selections
echo 'steam steam/question select I AGREE' | sudo debconf-set-selections
echo 'steam steam/licence note ' | sudo debconf-set-selections

# general
sudo apt-get install -y chromium-browser vim vlc easytag cifs-utils zsh ubuntu-restricted-extras variety

# i3
sudo apt-get install -y i3 feh rofi xbacklight youtube-viewer

# dev
sudo apt-get install -y mysql-server mysql-workbench meld git gitg git-flow python-software-properties python-virtualenv mongodb-server sublime-text-installer

# gaming
sudo apt-get install -y playonlinux steam

# google chrome
wget -P /tmp https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb

# google play music desktop player - gpmdp
wget -P /tmp https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v3.6.0/google-play-music-desktop-player_3.6.0_amd64.deb
sudo dpkg -i /tmp/google-play-music-desktop-player_3.6.0_amd64.deb

# hplip
# download from http://hplipopensource.com/hplip-web/install/install/index.html

zsh

# zgen
git clone https://github.com/tarjoilija/zgen.git .zgen

chsh -s /bin/zsh

# basher
git clone https://github.com/basherpm/basher.git ~/.basher
echo 'export PATH="$HOME/.basher/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(basher init -)"' >> ~/.zshrc
source ~/.zshrc

# nave.sh - Virtual Environments for Node
basher install isaacs/nave
nave install stable
sudo env "PATH=$PATH" nave usemain stable

# re-enable sudo password timeout
sudo sed -i "/Defaults timestamp_timeout=-1/d" /etc/sudoers
