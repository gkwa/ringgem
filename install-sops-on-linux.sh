#!/usr/bin/env bash

version=$(curl -fsSL https://api.github.com/repos/getsops/sops/releases/latest | jq -r .tag_name)
url=https://github.com/mozilla/sops/releases/download/${version}/sops-${version}.linux.amd64

sopsdir=$(mktemp -d /tmp/sops-XXXX)

curl -fsSLo $sopsdir/sops $url
install --mode 0755 --group root --owner root $sopsdir/sops /usr/local/bin/sops

sops --version

rm -rf $sopsdir
