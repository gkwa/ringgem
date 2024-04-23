#!/usr/bin/env bash

if command -v apt-get &>/dev/null; then
    apt-get install -y zip unzip
elif command -v dnf &>/dev/null; then
    dnf install -y zip unzip
elif command -v yum &>/dev/null; then
    yum install -y zip unzip
elif command -v zypper &>/dev/null; then
    zypper install -y zip unzip
elif command -v apk &>/dev/null; then
    apk add --no-cache zip unzip
elif command -v pacman &>/dev/null; then
    pacman -Sy --noconfirm zip unzip
else
    echo "Unsupported package manager. Please install zip and unzip manually."
    exit 1
fi
