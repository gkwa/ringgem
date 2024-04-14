#!/usr/bin/env bash

set +e
sudo --login --user linuxbrew brew install clusterawsadm
sudo --login --user linuxbrew brew install clusterawsadm
set -e

clusterawsadm version
