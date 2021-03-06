#!/bin/bash

# dependencies
sudo apt install -y \
    libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
    libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
    libstartup-notification0-dev libxcb-randr0-dev \
    libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
    libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
    autoconf libxcb-xrm0 libxcb-xrm-dev automake meson bison byacc

git clone https://github.com/xkbcommon/libxkbcommon /tmp/libxkbcommon
cd /tmp/libxkbcommon
meson setup build
ninja -C build

git clone https://www.github.com/Airblader/i3 /tmp/xcb-util-xrm
cd /tmp/xcb-util-xrm
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

# download i3-gaps
git clone https://www.github.com/Airblader/i3 /tmp/i3-gaps
cd /tmp/i3-gaps

# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install
