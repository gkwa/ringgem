#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

sudo --login --user linuxbrew bash -c '
  [ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh;
  brew install clusterctl
'
