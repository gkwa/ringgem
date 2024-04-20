#!/usr/bin/env bash

apt-get update

if command -v apt &>/dev/null; then
    DEBIAN_FRONTEND=noninteractive apt-get -y install awscli
elif command -v yum &>/dev/null; then
    yum -y install awscli
else
    echo "Neither apt nor yum package manager is available."
fi
