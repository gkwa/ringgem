#!/usr/bin/env bash

[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

brew install python
python3 --version
pip3 --version

type -a pip3

realpath /usr/local/bin/pip3
