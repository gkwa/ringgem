#!/bin/bash

if [ -f /etc/fedora-release ]; then
    dnf install -y python3
elif [ -f /etc/lsb-release ] || [ -f /etc/debian_version ]; then
    apt-get update
    apt-get install -y python3
else
    echo "Unsupported distribution"
    exit 1
fi

python3 -m ensurepip --default-pip
python3 -m pip install --upgrade pip setuptools wheel

pip3 --version
