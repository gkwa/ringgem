#!/usr/bin/env bash

# https://github.com/nestybox/sysbox/blob/master/docs/user-guide/install-package.md#installing-sysbox
# https://github.com/nestybox/sysbox/releases

if command -v docker &>/dev/null; then
    docker rm $(docker ps -a -q) -f 2>/dev/null || true
fi

tag_name=$(curl -s https://api.github.com/repos/nestybox/sysbox/releases | jq -r '.[0].tag_name')
version=${tag_name#v}
deb_name="sysbox-ce_${version}-0.linux_amd64.deb"
download_url="https://downloads.nestybox.com/sysbox/releases/${tag_name}/${deb_name}"

curl -LO $download_url
sudo apt-get install ./$deb_name
