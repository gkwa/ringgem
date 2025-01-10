#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

# unattended
curl https://sh.rustup.rs -sSf | sh -s -- -y
