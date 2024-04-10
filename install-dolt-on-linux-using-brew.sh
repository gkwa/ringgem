#!/usr/bin/env bash

if [[ $(uname) != "Linux" ]]; then
    echo "failed to install dolt"
fi

sudo --login --user linuxbrew brew install dolt
