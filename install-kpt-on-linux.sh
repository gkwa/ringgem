#!/usr/bin/env bash

# https://kpt.dev/installation/kpt-cli
# https://github.com/kptdev/kpt/blob/main/Formula/kpt.rb

releases_url=https://api.github.com/repos/GoogleContainerTools/kpt/releases
binary=kpt_linux_amd64

url=$(
    /home/linuxbrew/.linuxbrew/bin/allbranding query \
    --releases-url=$releases_url \
    --asset-regex=$binary | jq -r .browser_download_url
)
curl -fsSL -o kpt $url
install --mode 0755 kpt /usr/local/bin/kpt
kpt version
