#!/usr/bin/env bash

if [ -f /etc/redhat-release ]; then
    sudo yum install -y xz
elif [ -f /etc/arch-release ]; then
    sudo pacman -S --noconfirm xz
elif [ -f /etc/gentoo-release ]; then
    sudo emerge --ask --verbose app-arch/xz-utils
elif [ -f /etc/SuSE-release ]; then
    sudo zypper install -y xz
elif [ -f /etc/debian_version ]; then
    export DEBIAN_FRONTEND=noninteractive
    sudo apt-get install --assume-yes xz-utils
else
    echo "Unsupported Linux distribution."
    exit 1
fi
