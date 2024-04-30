#!/bin/bash

if [ -f /etc/fedora-release ]; then
    dnf install -y python3 python3-pip
elif [ -f /etc/lsb-release ] || [ -f /etc/debian_version ]; then
    apt-get update
    apt-get install -y python3 python3-pip
else
    echo "Unsupported distribution"
    exit 1
fi
