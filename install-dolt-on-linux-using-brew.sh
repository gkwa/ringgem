#!/usr/bin/env bash

if [[ $(uname) != "Linux" ]]; then
    echo "failed to install dolt"
fi

set +e
sudo --login --user linuxbrew brew install dolt
set -e

set -o | grep xtrace | cut -f2 -d- | read orig_xtrace
set +x
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
if [[ "$orig_xtrace" == "off" ]]; then set +x; else set -x; fi

dolt version
