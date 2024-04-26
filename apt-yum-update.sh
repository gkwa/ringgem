#!/usr/bin/env bash

[[ ! -f /etc/os-release ]] && exit 1

if grep --silent Ubuntu <<<"$(grep ^NAME= /etc/os-release)"; then
    echo Running apt-get update...
    sudo DEBIAN_FRONTEND=noninteractive apt-get update
fi
