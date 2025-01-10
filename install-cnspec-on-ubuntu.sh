#!/usr/bin/env bash

[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

url=$(allbranding query --releases-url=https://api.github.com/repos/mondoohq/cnquery/releases --asset-regex='cnquery_.*_linux_amd64.deb' | jq -r .browser_download_url)
curl -LO $url
deb=$(basename $url)
dpkg -i $deb

cnquery version >/dev/null

rm -f $deb

url=$(allbranding query --releases-url=https://api.github.com/repos/mondoohq/cnspec/releases --asset-regex='cnspec_.*_linux_amd64.deb' | jq -r .browser_download_url)
curl -LO $url
deb=$(basename $url)
dpkg -i $deb

cnspec version &>/dev/null

rm -f $deb
