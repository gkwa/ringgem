#!/usr/bin/env bash

repo_url="https://github.com/gnprice/toml-cli/releases"
version=$(curl -s https://api.github.com/repos/gnprice/toml-cli/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d v)
base="toml-$version-x86_64-linux"
basedir=/tmp/$base
tar=$base.tar.gz
url=https://github.com/gnprice/toml-cli/releases/download/v$version/$tar

mkdir -p $basedir
curl -o $basedir/$tar -L $url
tar -xzf $basedir/$tar -C $basedir
sudo install -m 755 $basedir/$base/toml /usr/local/bin/
rm -rf $basedir

toml --version