#!/usr/bin/env bash

mkdir -p /usr/local/{bin,src}
version=$(curl -sSL https://api.github.com/repos/derailed/k9s/releases/latest | grep -Po '"tag_name": "\K.*?(?=")' | tr -d v)
curl --create-dirs -sSLo /usr/local/src/k9s/$version/k9s_Linux_x86_64.tar.gz https://github.com/derailed/k9s/releases/download/v${version}/k9s_Linux_amd64.tar.gz
tar xzf /usr/local/src/k9s/$version/k9s_Linux_x86_64.tar.gz -C /usr/local/src/k9s/$version/
chmod -R +rx /usr/local/src/k9s
ln -fs /usr/local/src/k9s/$version/k9s /usr/local/bin/k9s
k9s version
