#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes kibana
