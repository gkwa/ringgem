#!/usr/bin/env bash

set -e

# https://docs.brew.sh/Homebrew-on-Linux
if ! id -u linuxbrew &>/dev/null; then
    sudo useradd --create-home linuxbrew --shell /bin/bash
fi

if ! test -f /etc/sudoers.d/linuxbrew; then
    echo "linuxbrew ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/linuxbrew
fi

script=$(mktemp /tmp/homebrew-XXXXX.sh)
chmod a+r $script
cat >$script <<'EOF'
command -v brew && exit 0

# Wait for dns
timeout=30
until curl -sSf "https://www.google.com" &>/dev/null || [[ $timeout -eq 0 ]]; do
  sleep 1
  ((timeout--))
done

export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH # suppress warning
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
source ~/.bashrc
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/linuxbrew/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if ! grep HOMEBREW_AUTO_UPDATE_SECS ~/.profile; then
  cat >> ~/.profile <<EOF1
export HOMEBREW_AUTO_UPDATE_SECS=$((24*60*60)) # 1 day
EOF1
fi

brew --version
EOF

cd /home/linuxbrew
sudo -u linuxbrew bash -e $script
