#!/usr/bin/env bash

set -e
set -x
set -u

sudo --login --user linuxbrew brew install opentofu

set -o | grep xtrace | cut -f2 -d- | read orig_xtrace
set +x
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
if [[ "$orig_xtrace" == "off" ]]; then set +x; else set -x; fi

tofu version >/dev/null
