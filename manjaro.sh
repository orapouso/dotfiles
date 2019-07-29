sudo pacman -S yaourt

# general
yaourt -S --noconfirm \
	chromium \
	vim \
	variety \
	vlc \
	easytag \
	base-devel \
	htop

# i3 desktop
#yaourt -S --noconfirm \
#	i3 \
#	rxvt-unicode \
#	feh \
#	rofi \
#	compton \
#	playerctl \
#	mpd \
#	arandr \
#	network-manager \
#	xss-lock \
#	xorg-xbacklight \
#	polybar \
#	ttf-font-awesome

yaourt -S --noconfirm \
	zsh \
	fonts-powerline

# develop
yaourt -S --noconfirm \
	code \
	gitg \
	meld \
	mysql-workbench \
	docker \
	nvm \
	firefox-developer-edition

# extra
yaourt -S --noconfirm \
	spotify \
	franz

# miniconda
wget "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" -O /tmp/Miniconda3-latest-Linux-x86_64.sh
bash /tmp/Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/.miniconda
conda init -q zsh
conda config --set changeps1 False

#oh-my-zsh shell
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# zgen
git clone https://github.com/tarjoilija/zgen.git $HOME/.zgen

# config files
git clone git@github.com:orapouso/dotfiles.git $HOME

ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
#ln -sf $HOME/dotfiles/.Xresources $HOME/.Xresources
#ln -sf $HOME/dotfiles/i3/config $HOME/.config/i3/config
#mkdir $HOME/.config/polybar
#ln -sf $HOME/dotfiles/polybar/config $HOME/.config/polybar/config
ln -sf $HOME/dotfiles/variety/variety.conf $HOME/.config/variety/variety.conf

	
