#!/usr/bin/env bash

if [ -f /etc/redhat-release ]; then
    sudo yum install -y btrfs-progs
elif [ -f /etc/arch-release ]; then
    sudo pacman -S --noconfirm btrfs-progs
elif [ -f /etc/gentoo-release ]; then
    sudo emerge --ask --verbose sys-fs/btrfs-progs
elif [ -f /etc/SuSE-release ]; then
    sudo zypper install -y btrfs-progs
elif [ -f /etc/debian_version ]; then
    export DEBIAN_FRONTEND=noninteractive
    sudo apt-get install --assume-yes btrfs-progs
else
    echo "Unsupported Linux distribution."
    exit 1
fi
