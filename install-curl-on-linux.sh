#!/usr/bin/env bash

if command -v apt-get &>/dev/null; then
    apt-get --yes install curl
elif command -v yum &>/dev/null; then
    yum -y install curl
else
    echo "Neither apt nor yum package manager is available."
fi
