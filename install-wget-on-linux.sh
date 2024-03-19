#!/usr/bin/env bash

if command -v apt &>/dev/null; then
    apt-get --yes install wget
elif command -v yum &>/dev/null; then
    yum -y install wget
else
    echo "Neither apt nor yum package manager is available."
fi
