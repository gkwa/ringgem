#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

brew install uv

export PATH="$HOME/.local/bin:$PATH"
uv tool update-shell
