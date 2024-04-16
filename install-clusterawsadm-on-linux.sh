#!/usr/bin/env bash

set -x
set -e
set -u

sudo --login --user linuxbrew brew install clusterawsadm

orig_xtrace=$(set -o | grep ^xtrace | awk '{print $2}')
set +x
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
if [[ $orig_xtrace == "off" ]]; then set +x; else set -x; fi

clusterawsadm version >/dev/null
