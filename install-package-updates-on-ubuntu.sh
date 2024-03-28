#!/usr/bin/env bash

set -x
set -e
set -u

set +e
apt-get upgrade --assume-yes
set -e

apt-get autoremove --assume-yes
apt-get autoclean --assume-yes
