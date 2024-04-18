#!/usr/bin/env bash

[[ ! -f /etc/os-release ]] && exit 0

if ! grep --silent Ubuntu <<<"$(grep ^NAME= /etc/os-release)"; then
    exit 0
fi

echo Running apt-get update...
DEBIAN_FRONTEND=noninteractive apt-get update
