#!/usr/bin/env bash

if command -v apt &>/dev/null; then
    DEBIAN_FRONTEND=NONINTERACTIVE apt-get -y install python3-pip

elif command -v yum &>/dev/null; then
    yum -y install python3
else
    echo "Neither apt nor yum package manager is available."
fi
