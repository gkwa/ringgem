#!/usr/bin/env bash

set +e
sudo --login --user linuxbrew brew install clusterawsadm
set -e

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
clusterawsadm version
