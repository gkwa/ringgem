#!/usr/bin/env bash

if command -v apt &>/dev/null; then
    #    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo skipping for now since you are running as root

elif command -v yum &>/dev/null; then
    sudo yum -y groupinstall 'Development Tools'
    brew install gcc

else
    echo neither apt nor yum package manager is available

fi
