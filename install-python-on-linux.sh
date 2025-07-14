#!/usr/bin/env bash

[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

if [ -f /etc/fedora-release ]; then
    dnf install -y python3
elif [ -f /etc/lsb-release ] || [ -f /etc/debian_version ]; then
    export DEBIAN_FRONTEND=noninteractive
    apt-get install -y python3
fi
