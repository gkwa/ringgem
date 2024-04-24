#!/usr/bin/env bash

if command -v apt-get &>/dev/null; then
    apt-get install -y unzip
elif command -v dnf &>/dev/null; then
    dnf install -y unzip
elif command -v yum &>/dev/null; then
    yum install -y unzip
elif command -v zypper &>/dev/null; then
    zypper install -y unzip
elif command -v apk &>/dev/null; then
    apk add --no-cache unzip
elif command -v pacman &>/dev/null; then
    pacman -Sy --noconfirm unzip
else
    echo "Unsupported package manager. Please install unzip manually."
    exit 1
fi

unzip -v
