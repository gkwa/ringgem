#!/usr/bin/env bash

[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
python3 /tmp/get-pip.py

python3 --version
pip3 --version

type -a pip3

realpath /usr/local/bin/pip3

rm -f /tmp/get-pip.py
