#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

bash <(curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh)
