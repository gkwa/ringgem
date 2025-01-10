#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

set -e
set -x
set -u

export DEBIAN_FRONTEND=noninteractive

apt-get install --fix-missing --assume-yes elasticsearch
