#!/usr/bin/env bash

# https://github.com/Homebrew/homebrew-bundle?tab=readme-ov-file#homebrew-bundle

set -e

cat >/home/linuxbrew/Brewfile <<'EOF'
tap "carvel-dev/carvel"
brew "ytt"

brew "jj" # https://martinvonz.github.io/jj/prerelease/install-and-setup/#homebrew
EOF

chmod a+r /home/linuxbrew/Brewfile
sudo --login --user linuxbrew brew bundle install
