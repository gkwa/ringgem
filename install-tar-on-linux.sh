#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

if command -v apt-get >/dev/null 2>&1; then
    DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes tar
elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y tar
elif command -v yum >/dev/null 2>&1; then
    sudo yum install -y tar
elif command -v zypper >/dev/null 2>&1; then
    sudo zypper install -y tar
elif command -v apk >/dev/null 2>&1; then
    sudo apk add tar
else
    echo "Unsupported package manager. Please install tar manually."
    exit 1
fi
