#!/usr/bin/env bash

# https://github.com/restatedev/restate/releases
# https://github.com/restatedev/restate

tmp=$(mktemp -d /tmp/restate-XXXX)
cd $tmp

rel_url=https://api.github.com/repos/restatedev/restate/releases
manifest=$(/home/linuxbrew/.linuxbrew/bin/allbranding query --releases-url=$rel_url --asset-regex='restate.x86_64-unknown-linux-musl.tar.gz')
url=$(echo "$manifest" | jq -r .browser_download_url)
version=$(echo "$manifest" | jq -r .version)

gz=restate.x86_64-unknown-linux-musl.tar.gz

echo url:$url
echo version:$version

curl -Lo $gz $url
tar xzf $gz
install --mode 0755 restate /usr/local/bin/restate
install --mode 0755 restate-server /usr/local/bin/restate-server

restate --version
restate-server --version

cd
rm -rf $tmp
