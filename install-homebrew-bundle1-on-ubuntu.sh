#!/usr/bin/env bash

# https://github.com/Homebrew/homebrew-bundle?tab=readme-ov-file#homebrew-bundle

cat >/home/linuxbrew/Brewfile <<'EOF'
tap "carvel-dev/carvel"
brew "gcc"
brew "ytt"
EOF


chmod a+r /home/linuxbrew/Brewfile
sudo --login --user linuxbrew brew bundle install
