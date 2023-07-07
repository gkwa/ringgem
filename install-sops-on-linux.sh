#!/usr/bin/env bash

version=$(curl --silent https://api.github.com/repos/getsops/sops/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')
echo $version
curl -sSL -o /usr/local/bin/sops https://github.com/mozilla/sops/releases/download/$version/sops-${version}.linux
chmod +x /usr/local/bin/sops
sops --version
