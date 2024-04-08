#!/usr/bin/env bash

set -e
set -u

[[ ! -f /etc/os-release ]] && exit 0

if ! grep --silent Ubuntu <<<"$(grep ^NAME= /etc/os-release)"; then
    exit 0
fi

apt_upgrade() {
    echo "Running apt-get upgrade..."
    DEBIAN_FRONTEND=noninteractive apt-get upgrade --assume-yes

    apt-get autoremove --assume-yes
    apt-get autoclean --assume-yes
}

apt_upgrade
