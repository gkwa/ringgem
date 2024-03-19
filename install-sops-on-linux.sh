#!/usr/bin/env bash

version=$(curl -fsSL https://api.github.com/repos/getsops/sops/releases/latest | grep tag_name | cut -d: -f2- | tr -d ' ,v\"')
url=https://github.com/mozilla/sops/releases/download/v$version/sops-v$version.linux.amd64
rm -f /tmp/sops
wget --output-document=/tmp/sops $url
install --mode 0755 --group root --owner root /tmp/sops /usr/local/bin/sops
rm /tmp/sops
sops --version
