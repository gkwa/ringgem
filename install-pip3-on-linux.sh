#!/usr/bin/env bash

if command -v apt-get &>/dev/null; then
    export DEBIAN_FRONTEND=noninteractive
    apt-get --assume-yes install python3-pip

elif command -v yum &>/dev/null; then
    yum --yes install python3-pip

else
    echo "Neither apt nor yum package manager is available."

fi
