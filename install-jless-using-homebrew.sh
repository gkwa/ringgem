#!/usr/bin/env bash

sudo --login --user linuxbrew brew install jless

orig_xtrace=$(set -o | grep ^xtrace | awk '{print $2}')
set +x
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
if [[ $orig_xtrace == "off" ]]; then set +x; else set -x; fi

jless --version >/dev/null
