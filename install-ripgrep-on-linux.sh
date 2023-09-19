#!/usr/bin/env bash

# install ripgrep
version=$(wget -qO - https://api.github.com/repos/BurntSushi/ripgrep/releases/latest | grep tag_name | cut -d: -f2- | tr -d ' \":,')
base=ripgrep-${version}-x86_64-unknown-linux-musl
wget -qO - https://github.com/BurntSushi/ripgrep/releases/download/$version/$base.tar.gz | tar -C /usr/local/bin --no-same-owner -xz $base/rg
rg --version
