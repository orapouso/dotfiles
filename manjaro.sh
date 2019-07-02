sudo pacman -S yaourt

# general
yaourt -S --noconfirm \
	chromium \
	vim \
	variety \
	arandr \
	vlc \
	easytag \
	mpd \
	base-devel \
	htop \
	franz \
	network-manager

# desktop
yaourt -S --noconfirm \
	i3 \
	rxvt-unicode \
	zsh \
	feh \
	rofi \
	compton \
	playerctl \
	xss-lock \
	xorg-xbacklight \
	polybar \
	ttf-font-awesome

# develop
yaourt -S --noconfirm \
	code \
	gitg \
	meld \
	python-pip \
	mysql-workbench \
	docker \
	nvm \
	firefox-developer-edition

# extra
yaourt -S --noconfirm \
	spotify

# zgen
git clone https://github.com/tarjoilija/zgen.git .zgen

# config files
git clone git@github.com:orapouso/dotfiles.git $HOME

ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.Xresources ~/.Xresources
ln -sf ~/dotfiles/i3/config ~/.config/i3/config
mkdir ~/.config/polybar
ln -sf ~/dotfiles/polybar/config ~/.config/polybar/config
ln -sf ~/dotfiles/variety/variety.conf ~/.config/variety/variety.conf

	
