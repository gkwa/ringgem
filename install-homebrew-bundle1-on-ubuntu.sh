#!/usr/bin/env bash

# https://github.com/Homebrew/homebrew-bundle?tab=readme-ov-file#homebrew-bundle

cat >/home/linuxbrew/Brewfile <<'EOF'
tap "carvel-dev/carvel"
brew "ytt"

brew "gofumpt"
brew "golangci-lint"
EOF

chmod a+r /home/linuxbrew/Brewfile
sudo --login --user linuxbrew brew bundle install
