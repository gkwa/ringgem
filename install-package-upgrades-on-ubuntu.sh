#!/usr/bin/env bash

set -e
set -u

[[ ! -f /etc/os-release ]] && exit 0

if ! grep --silent Ubuntu <<<"$(grep ^NAME= /etc/os-release)"; then
    exit 0
fi

apt_upgrade() {
    local upgrade_file="/var/cache/apt/last_upgrade"

    if [[ -f $upgrade_file ]]; then
        local last_upgrade=$(stat -c %Y "$upgrade_file")
        local current_time=$(date +%s)
        local elapsed_time=$((current_time - last_upgrade))

        if ((elapsed_time < 600)); then
            echo "apt-get upgrade already executed in the last 10 minutes, force by rm -f ${upgrade_file}"
            return 0
        fi
    fi

    echo "Running apt-get upgrade..."
    DEBIAN_FRONTEND=noninteractive apt-get upgrade --assume-yes
    touch "$upgrade_file"
    echo "apt-get upgrade completed."


    apt-get autoremove --assume-yes
    apt-get autoclean --assume-yes
}

apt_upgrade
