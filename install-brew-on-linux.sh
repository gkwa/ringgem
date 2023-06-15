#!/usr/bin/env bash

if command -v apt &>/dev/null; then
    echo stuff goes here
elif command -v yum &>/dev/null; then
    sudo yum -y groupinstall 'Development Tools'
    brew install gcc
else
    echo "Neither apt nor yum package manager is available."
fi
