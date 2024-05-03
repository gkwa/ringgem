#!/bin/bash

curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
python3 /tmp/get-pip.py

python3 --version
pip3 --version

rm -f /tmp/get-pip.py
