#!/usr/bin/env bash

release_url=https://api.github.com/repos/BurntSushi/ripgrep/releases/latest
version=$(curl -fsSL $release_url | grep tag_name | cut -d: -f2- | tr -d ' \":,')
base=ripgrep-$version-x86_64-unknown-linux-musl
url=https://github.com/BurntSushi/ripgrep/releases/download/$version/$base.tar.gz
curl -fsSL $url | tar -C /usr/local/bin --no-same-owner -xz $base/rg

ln -fs /usr/local/bin/$base/rg /usr/local/bin/rg
rg --version