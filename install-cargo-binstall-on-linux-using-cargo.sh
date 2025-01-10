#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

. "$HOME/.cargo/env"

export PATH=/root/.cargo/bin:$PATH

# https://github.com/cargo-bins/cargo-binstall?tab=readme-ov-file#quickly
curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
