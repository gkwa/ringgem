#!/usr/bin/env bash

curl -sSL https://raw.githubusercontent.com/upciti/wakemeops/main/assets/install_repository | bash
apt-get --assume-yes install glab
glab version
