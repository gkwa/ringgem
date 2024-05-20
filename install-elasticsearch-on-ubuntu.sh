#!/usr/bin/env bash

set -e
set -x
set -u

export DEBIAN_FRONTEND=noninteractive

apt-get install --fix-missing --assume-yes elasticsearch
