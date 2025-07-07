#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh


dir=$(mktemp -d tenderthrush-XXXX)
git clone https://github.com/gkwa/tenderthrush.git $dir

cd $dir

packer init


just setup

cd
rm -rf $dir
