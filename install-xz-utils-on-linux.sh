#!/usr/bin/env bash

if [ -f /etc/redhat-release ]; then
    if command -v dnf &>/dev/null; then
        sudo dnf install -y xz
    else
        sudo yum install -y xz
    fi
elif [ -f /etc/debian_version ]; then
    sudo apt-get update
    sudo apt-get install -y xz-utils
elif [ -f /etc/arch-release ]; then
    sudo pacman -Sy --noconfirm xz
elif [ -f /etc/alpine-release ]; then
    sudo apk add xz
elif [ "$(uname)" == "Darwin" ]; then
    brew install xz
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ] || [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    choco install xz
else
    echo "Unsupported operating system"
    exit 1
fi
