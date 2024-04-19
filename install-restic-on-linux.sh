#!/usr/bin/env bash

OS=$(uname -s)

case $OS in
Linux)
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get install -y restic
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y restic
    elif command -v yum >/dev/null 2>&1; then
        sudo yum install -y restic
    elif command -v zypper >/dev/null 2>&1; then
        sudo zypper install -y restic
    elif command -v apk >/dev/null 2>&1; then
        sudo apk add restic
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -S --noconfirm restic
    else
        echo "Unsupported Linux distribution. Please install restic manually."
        exit 1
    fi
    ;;
Darwin)
    # macOS
    if command -v brew >/dev/null 2>&1; then
        brew install restic
    elif command -v port >/dev/null 2>&1; then
        sudo port install restic
    else
        echo "Homebrew or MacPorts not found. Please install restic manually."
        exit 1
    fi
    ;;
FreeBSD)
    sudo pkg install -y restic
    ;;
OpenBSD)
    sudo pkg_add restic
    ;;
SunOS)
    echo "Please install restic manually on Solaris."
    exit 1
    ;;
*)
    echo "Unsupported operating system. Please install restic manually."
    exit 1
    ;;
esac

echo "restic has been successfully installed."
