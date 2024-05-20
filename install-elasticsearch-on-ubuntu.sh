#!/usr/bin/env bash

set -e
set -x
set -u

export DEBIAN_FRONTEND=noninteractive

timeout 10m bash -c "
    until apt-get install --fix-missing --assume-yes elasticsearch
    do
        sleep 10s
    done
"
