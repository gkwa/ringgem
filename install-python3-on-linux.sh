#!/usr/bin/env bash

if command -v apt &>/dev/null; then
    DEBIAN_FRONTEND=noninteractive apt-get -y install python3

elif command -v amazon-linux-extras &>/dev/null; then
    amazon-linux-extras install -y python3.8

elif command -v yum &>/dev/null; then
    yum -y install python3

else
    echo "Neither apt nor yum package manager is available."
fi
