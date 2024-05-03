#!/bin/bash

if [ -f /etc/fedora-release ]; then
    dnf install -y python3
elif [ -f /etc/lsb-release ] || [ -f /etc/debian_version ]; then
    apt-get install -y python3
fi
