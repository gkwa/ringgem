#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

brew install uv

export PATH="$HOME/.local/bin:$PATH"
uv tool update-shell

# We need this:
# # export PATH="$HOME/.local/bin:$PATH"
# because of this:
# [root@ip-172-31-23-184:~]$ uv tool update-shell --quiet; echo $?
# error: The executable directory /root/.local/bin is not in PATH, but the Bash configuration files are already up-to-date
# 2
# [root@ip-172-31-23-184:~]$
