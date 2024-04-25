#!/usr/bin/env bash

url=$(allbranding query --releases-url=https://api.github.com/repos/gnprice/toml-cli/releases --asset-regex='toml.*x86_64-linux.tar.gz' | jq -r .browser_download_url)
curl -fsSL $url | tar -C /usr/local/bin --no-same-owner -xz test

toml --version

rm -rf $basedir
