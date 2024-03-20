#!/usr/bin/env bash

if command -v apt &>/dev/null; then
    DEBIAN_FRONTEND=noninteractive apt-get -y install git

elif command -v yum &>/dev/null; then
    yum -y install git

else
    echo "Neither apt nor yum package manager is available."
fi
