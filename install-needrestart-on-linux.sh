#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

if command -v apt-get &>/dev/null; then
    sudo apt-get update
    sudo apt-get install -y needrestart
elif command -v dnf &>/dev/null; then
    sudo dnf install -y needrestart
elif command -v yum &>/dev/null; then
    sudo yum install -y epel-release
    sudo yum install -y needrestart
elif command -v zypper &>/dev/null; then
    sudo zypper refresh
    sudo zypper install -y needrestart
elif command -v pacman &>/dev/null; then
    sudo pacman -Sy needrestart
else
    echo "Unsupported distribution. Please install needrestart manually."
    exit 1
fi

echo "needrestart has been successfully installed."
