#!/usr/bin/env bash

if [ -f /etc/redhat-release ]; then
    sudo yum install -y curl
elif [ -f /etc/arch-release ]; then
    sudo pacman -S --noconfirm curl
elif [ -f /etc/gentoo-release ]; then
    sudo emerge --ask --verbose net-misc/curl
elif [ -f /etc/SuSE-release ]; then
    sudo zypper install -y curl
elif [ -f /etc/debian_version ]; then
    export DEBIAN_FRONTEND=noninteractive
    sudo apt-get update
    sudo apt-get install --assume-yes curl
else
    echo "Unsupported Linux distribution."
    exit 1
fi
