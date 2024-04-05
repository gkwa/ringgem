#!/usr/bin/env bash

# adapted from https://discourse.nixos.org/t/how-to-run-the-nix-installer-silently-from-a-shell-script/25633

curl -L https://nixos.org/nix/install | sh -s -- --daemon --yes

script=/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
[[ -e $script ]] && source $script

nix --version
