#!/bin/bash

# disable sudo password timeout
sudo sh -c 'echo "\nDefaults timestamp_timeout=-1">>/etc/sudoers'

# terminator
sudo add-apt-repository -y ppa:gnome-terminator

# numix
sudo add-apt-repository -y ppa:numix/ppa

# sublime text 3
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3

# atom text editor
sudo add-apt-repository -y ppa:webupd8team/atom

# nodejs - does apt-get update
#LTS
#curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
#Stable
#curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
#using nave.sh

sudo apt-get update

# setting msfonts default eula
echo 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true' | sudo debconf-set-selections

# setting mysql root password
echo 'mysql-server mysql-server/root_password password rootroot' | sudo debconf-set-selections
echo 'mysql-server mysql-server/root_password_again password rootroot' | sudo debconf-set-selections
echo 'steam steam/question select I AGREE' | sudo debconf-set-selections
echo 'steam steam/licence note ' | sudo debconf-set-selections

# general
sudo apt-get install -y chromium-browser vim vlc easytag terminator gdebi cifs-utils zsh ubuntu-restricted-extras

# dev
sudo apt-get install -y mysql-server mysql-workbench meld git gitg git-flow openjdk-8-jre python-software-properties python python-pip mongodb-server atom sublime-text-installer

# gaming
sudo apt-get install -y playonlinux steam

# numix theme
sudo apt-get install -y numix-gtk-theme numix-icon-theme-circle

# google chrome
wget -P /tmp https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb
wget -P /tmp https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb /tmp/google-chrome-unstable_current_amd64.deb

# slack
wget -P /tmp https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-1.2.6-amd64.deb
sudo dpkg -i /tmp/slack-desktop-1.2.6-amd64.deb

# python virtualenv
sudo pip install virtualenv

#oh-my-zsh shell
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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