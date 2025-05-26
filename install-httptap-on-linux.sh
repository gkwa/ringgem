#!/usr/bin/env bash

# https://github.com/monasticacademy/httptap/releases
# https://github.com/monasticacademy/httptap

[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

tmp=$(mktemp -d /tmp/httptap-XXXX)
cd $tmp

rel_url=https://api.github.com/repos/monasticacademy/httptap/releases
arch=$(uname -m)
manifest=$(/home/linuxbrew/.linuxbrew/bin/allbranding query --releases-url=$rel_url --asset-regex="httptap_linux_${arch}.tar.gz")

url=$(echo "$manifest" | jq -r .browser_download_url)
version=$(echo "$manifest" | jq -r .version)
gz=httptap_linux_${arch}.tar.gz

echo url:$url
echo version:$version

curl -Lo $gz $url
tar xzf $gz

install --mode 0755 httptap /usr/local/bin/httptap

httptap --help

cd
rm -rf $tmp
