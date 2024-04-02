#!/usr/bin/env bash

# https://docs.brew.sh/Homebrew-on-Linux

sudo useradd --create-home linuxbrew --shell /bin/bash
echo "linuxbrew ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/linuxbrew

sudo apt-get install --assume-yes build-essential procps curl file git gcc




script=$(mktemp /tmp/homebrew-XXXXX.sh)
cat >$script <<'EOF'
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
source ~/.bashrc

(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/linuxbrew/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
EOF



sudo -u linuxbrew bash -xe $script
