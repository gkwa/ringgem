#!/bin/bash

[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh 


if command -v apt-get &>/dev/null; then
    sudo apt-get install -y pass
elif command -v yum &>/dev/null; then
    sudo yum install -y pass
elif command -v zypper &>/dev/null; then
    sudo zypper install -y password-store
elif command -v emerge &>/dev/null; then
    yes | emerge -av pass
elif command -v pacman &>/dev/null; then
    yes | pacman -S pass
elif command -v brew &>/dev/null; then
    brew install pass
elif command -v pkg &>/dev/null; then
    yes | pkg install password-store
else
    echo "Unsupported package manager. Please install password-store manually."
fi
