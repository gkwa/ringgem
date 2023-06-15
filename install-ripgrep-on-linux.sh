#!/usr/bin/env bash

version=$(curl -s https://api.github.com/repos/BurntSushi/ripgrep/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')
curl -Lo /usr/local/src/ripgrep-${version}-x86_64-unknown-linux-musl.tar.gz https://github.com/BurntSushi/ripgrep/releases/download/$version/ripgrep-${version}-x86_64-unknown-linux-musl.tar.gz
tar xzf /usr/local/src/ripgrep-${version}-x86_64-unknown-linux-musl.tar.gz -C /tmp
install --mode 755 /tmp/ripgrep-${version}-x86_64-unknown-linux-musl/rg /usr/local/bin/rg
rg --version
