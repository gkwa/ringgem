#!/usr/bin/env bash

curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install --assume-yes nodejs
node -v
