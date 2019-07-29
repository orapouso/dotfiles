#!/bin/bash

# disable sudo password timeout
sudo sh -c 'echo "\nDefaults timestamp_timeout=-1">>/etc/sudoers'

sudo apt-get update

# setting msfonts default eula
# used in ubuntu-restricted-extras
echo 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true' | sudo debconf-set-selections

# general
sudo apt install -y vim gdebi cifs-utils zsh tlp tlp-rdw ubuntu-restricted-extras gnome-tweak-tool variety fonts-powerline

sudo snap install spotify vlc chromium
sudo snap install code --classic

# dev
sudo apt install -y git gitg meld default-jre python3

# firefox developer
wget "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=pt-BR" -O /tmp/firefox-developer.tar.bz2
sudo tar -jxvf  /tmp/firefox-developer.tar.bz2 -C /opt/
sudo mv /opt/firefox*/ /opt/firefox-developer
sudo ln -sf /opt/firefox-developer/firefox /usr/bin/firefox-developer
echo -e '[Desktop Entry]\n Version=59.0.3\n Encoding=UTF-8\n Name=Mozilla Firefox\n Comment=Navegador Web\n Exec=/opt/firefox-developer/firefox\n Icon=/opt/firefox-developer/browser/chrome/icons/default/default128.png\n Type=Application\n Categories=Network' | sudo tee /usr/share/applications/firefox-developer.desktop
rm -rf /tmp/firefox-developer.tar.bz2

# gaming
sudo apt install -y playonlinux steam

# nvm
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

#oh-my-zsh shell
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# zgen
git clone https://github.com/tarjoilija/zgen.git $HOME/.zgen

# miniconda
wget "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" -O /tmp/Miniconda3-latest-Linux-x86_64.sh
bash /tmp/Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/.miniconda
conda init -q zsh
conda config --set changeps1 False

# config files
git clone https://github.com/orapouso/dotfiles.git $HOME/dotfiles

ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/variety/variety.conf ~/.config/variety/variety.conf

# re-enable sudo password timeout
sudo sed -i "/Defaults timestamp_timeout=-1/d" /etc/sudoers
