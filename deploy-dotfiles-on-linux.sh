#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

chezmoi init --no-tty --force --apply gkwa/dotfiles

# hydrate the dotfiles
time bash -l -c 'echo hello'
