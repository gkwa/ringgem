#!/usr/bin/env bash

max_attempts=5
attempt=1

while [[ $attempt -le $max_attempts ]]; do
    echo "Attempt $attempt:"

    [[ ! -f /etc/os-release ]] && exit 1

    if grep --silent Ubuntu <<<"$(grep ^NAME= /etc/os-release)"; then
        echo Running apt-get update...
        if sudo DEBIAN_FRONTEND=noninteractive apt-get update; then
            echo "apt-get update succeeded. Exiting."
            exit 0
        else
            echo "apt-get update failed. Retrying."
        fi
    fi

    attempt=$((attempt + 1))
    echo "Waiting for 5 seconds before the next attempt..."
    sleep 5
done

echo "All attempts failed. Exiting with an error."
exit 1
