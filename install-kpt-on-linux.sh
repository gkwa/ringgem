#!/usr/bin/env bash

# https://kpt.dev/installation/kpt-cli
# https://github.com/kptdev/kpt/blob/main/Formula/kpt.rb

sudo --login --user linuxbrew brew tap GoogleContainerTools/kpt https://github.com/GoogleContainerTools/kpt.git
sudo --login --user linuxbrew brew install kpt

kpt version
