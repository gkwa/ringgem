#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

brew install gkwa/tools/cloudelf

cloudelf -h
