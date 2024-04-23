#!/usr/bin/env bash

version=$(curl -s https://api.github.com/repos/gnprice/toml-cli/releases/latest | jq -r .tag_name)
base=toml-${version#v}-x86_64-linux
basedir=/tmp/$base
tar=$base.tar.gz
url=https://github.com/gnprice/toml-cli/releases/download/${version}/$tar

mkdir -p $basedir
curl -o $basedir/$tar -L $url
tar -xzf $basedir/$tar -C $basedir
sudo install -m 755 $basedir/$base/toml /usr/local/bin/

toml --version

rm -rf $basedir
