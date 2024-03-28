#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

if apt-get install --assume-yes elasticsearch; then
    exit 0
fi

apt-get install --fix-missing --assume-yes elasticsearch
