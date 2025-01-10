#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

curl -fsSL https://deb.nodesource.com/setup_23.x -o /tmp/nodesource_setup.sh
sudo -E bash /tmp/nodesource_setup.sh
sudo apt-get install -y nodejs
node -v
rm /tmp/nodesource_setup.sh
