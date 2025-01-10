#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

export PATH=$HOME/.krew/bin:$PATH
kubectl krew install konfig
