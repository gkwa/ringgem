#!/usr/bin/env bash

if command -v apt-get &>/dev/null; then
    apt-get install -y unzip zip
elif command -v dnf &>/dev/null; then
    dnf install -y unzip zip
elif command -v yum &>/dev/null; then
    yum install -y unzip zip
elif command -v zypper &>/dev/null; then
    zypper install -y unzip zip
elif command -v apk &>/dev/null; then
    apk add --no-cache unzip zip
elif command -v pacman &>/dev/null; then
    pacman -Sy --noconfirm unzip zip
else
    echo "Unsupported package manager. Please install zip and unzip manually."
    exit 1
fi

unzip -v
zip -?
