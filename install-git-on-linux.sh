#!/usr/bin/env bash

if [ -f /etc/redhat-release ]; then
    sudo yum install -y git
elif [ -f /etc/arch-release ]; then
    sudo pacman -S --noconfirm git
elif [ -f /etc/gentoo-release ]; then
    sudo emerge --ask --verbose dev-vcs/git
elif [ -f /etc/SuSE-release ]; then
    sudo zypper install -y git
elif [ -f /etc/debian_version ]; then
    sudo apt-get update
    sudo apt-get install -y git
else
    echo "Unsupported Linux distribution."
    exit 1
fi
