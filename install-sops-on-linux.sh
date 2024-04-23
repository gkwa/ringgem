#!/usr/bin/env bash

version=$(curl -fsSL https://api.github.com/repos/getsops/sops/releases/latest | jq -r '.tag_name')
url=https://github.com/mozilla/sops/releases/download/${version}/sops-${version#v}.linux.amd64
rm -f /tmp/sops
curl -fsSLo /tmp/sops $url
install --mode 0755 --group root --owner root /tmp/sops /usr/local/bin/sops
sops --version

rm /tmp/sops
