#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

if apt-get --assume-yes install default-jre; then
    exit 0
fi

apt-get --assume-yes install openjdk-11-jre
