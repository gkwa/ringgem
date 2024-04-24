#!/bin/bash

if command -v apt-get &>/dev/null; then
    sudo apt-get install -y btrfs-progs
elif command -v dnf &>/dev/null; then
    sudo dnf install -y btrfs-progs
elif command -v yum &>/dev/null; then
    sudo yum install -y btrfs-progs
elif command -v zypper &>/dev/null; then
    sudo zypper install -y btrfsprogs
elif command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm btrfs-progs
elif command -v apk &>/dev/null; then
    sudo apk add btrfs-progs
else
    echo "Unsupported package manager. Please install btrfs-progs manually."
    exit 1
fi
