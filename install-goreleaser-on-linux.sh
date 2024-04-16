#!/usr/bin/env bash

# https://goreleaser.com/install/#apt

if command -v yum &> /dev/null; then
   echo '[goreleaser]
name=GoReleaser
baseurl=https://repo.goreleaser.com/yum/
enabled=1
gpgcheck=0' | sudo tee /etc/yum.repos.d/goreleaser.repo
   sudo yum install -y goreleaser
elif command -v apt-get &> /dev/null; then
   echo 'deb [trusted=yes] https://repo.goreleaser.com/apt/ /' | sudo tee /etc/apt/sources.list.d/goreleaser.list
   sudo apt-get update
   sudo apt-get install --assume-yes goreleaser
else
   echo "Neither yum nor apt package manager found"
   exit 1
fi
