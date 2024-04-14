#!/usr/bin/env bash

set +e
sudo --login --user linuxbrew brew install clusterawsadm
set -e


set -o | grep xtrace | cut -f2 -d- | read orig_xtrace
set +x
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
if [[ "$orig_xtrace" == "off" ]]; then set +x; else set -x; fi

clusterawsadm version
