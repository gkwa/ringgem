#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

curl -fsSL https://get.jetpack.io/devbox | FORCE=1 bash
