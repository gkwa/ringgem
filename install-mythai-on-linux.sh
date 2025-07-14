#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

uv tool install https://github.com/gkwa/mythai/archive/refs/heads/master.zip

mythai --help
