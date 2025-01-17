#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

chezmoi init --no-tty --force --depth 1 --apply gkwa/dotfiles
