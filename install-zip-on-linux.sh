#!/usr/bin/env bash

if [ -f /etc/redhat-release ]; then
    sudo yum install -y zip
elif [ -f /etc/arch-release ]; then
    sudo pacman -S --noconfirm zip
elif [ -f /etc/gentoo-release ]; then
    sudo emerge --ask --verbose app-arch/zip
elif [ -f /etc/SuSE-release ]; then
    sudo zypper install -y zip
elif [ -f /etc/debian_version ]; then
    export DEBIAN_FRONTEND=noninteractive
    sudo apt-get install --assume-yes zip
else
    echo "Unsupported Linux distribution."
    exit 1
fi
