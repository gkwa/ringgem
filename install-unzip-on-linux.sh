#!/usr/bin/env bash

if command -v apt &>/dev/null; then
    DEBIAN_FRONTEND=NONINTERACTIVE apt-get -y install unzip
elif command -v yum &>/dev/null; then
    yum -y install unzip
else
    echo "Neither apt nor yum package manager is available."
fi
