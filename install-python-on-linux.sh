#!/bin/bash

if [ -f /etc/fedora-release ]; then
    dnf install -y python3
elif [ -f /etc/lsb-release ] || [ -f /etc/debian_version ]; then
    apt-get install -y python3
fi

curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
python3 /tmp/get-pip.py

python3 --version
pip3 --version

rm -f /tmp/get-pip.py
