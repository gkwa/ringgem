#!/bin/bash

OS=$(uname -s)

# Install GPG based on the operating system
if [[ $OS == "Linux" ]]; then
    # Determine the Linux distribution
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get install -y gnupg
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y gnupg
    elif command -v yum >/dev/null 2>&1; then
        sudo yum install -y gnupg
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -Sy --noconfirm gnupg
    elif command -v zypper >/dev/null 2>&1; then
        sudo zypper install -y gnupg
    else
        echo "Unsupported Linux distribution. Please install GPG manually."
        exit 1
    fi
elif [[ $OS == "Darwin" ]]; then
    # macOS
    if command -v brew >/dev/null 2>&1; then
        # Install using Homebrew
        brew install gnupg
    else
        echo "Homebrew not found. Please install Homebrew and then run this script again."
        exit 1
    fi
elif [[ $OS == "FreeBSD" ]]; then
    # FreeBSD
    sudo pkg install -y gnupg
elif [[ $OS == "OpenBSD" ]]; then
    # OpenBSD
    sudo pkg_add gnupg
else
    echo "Unsupported operating system. Please install GPG manually."
    exit 1
fi

echo "GPG installation completed."
