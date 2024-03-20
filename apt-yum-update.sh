#!/usr/bin/env bash

[[ ! -f /etc/os-release ]] && exit 0

if ! grep --silent Ubuntu <<<"$(grep ^NAME= /etc/os-release)"; then
    exit 0
fi

apt_update() {
    local update_file="/var/cache/apt/last_update"

    if [[ -f $update_file ]]; then
        local last_update=$(stat -c %Y "$update_file")
        local current_time=$(date +%s)
        local elapsed_time=$((current_time - last_update))

        if ((elapsed_time < 600)); then
            echo "apt-get update already executed in the last 10 minutes, force by rm -f ${update_file}"
            return 0
        fi
    fi

    echo "Running apt-get update..."
    DEBIAN_FRONTEND=noninteractive apt-get update
    touch "$update_file"
    echo "apt-get update completed."
}

apt_update
