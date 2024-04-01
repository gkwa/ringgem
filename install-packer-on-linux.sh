#!/usr/bin/env bash

# https://developer.hashicorp.com/packer/install
# https://releases.hashicorp.com/packer/

cd /tmp

url=https://releases.hashicorp.com/packer/
ver=$(curl -s $url | grep -v alpha | grep -oE 'packer_[0-9]+\.[0-9]+\.[0-9]+' | sort -V | tail -n1 | cut -d'_' -f2)
dl_url="${url}${ver}/packer_${ver}_linux_amd64.zip"

echo "Downloading Packer ${ver}..."
curl -sL $dl_url -o packer.zip

echo "Unpacking Packer..."
unzip -q packer.zip

echo "Installing Packer to /usr/local/bin/packer..."
install --mode 0755 --group root --owner root packer /usr/local/bin/packer

echo "Cleaning up..."
rm packer.zip
rm -f /tmp/packer

packer --version
