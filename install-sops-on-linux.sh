#!/usr/bin/env bash

version=$(curl -sSL https://api.github.com/repos/getsops/sops/releases/latest | grep tag_name | cut -d: -f2- | tr -d ' ",v')
curl -sSL -o /usr/local/bin/sops https://github.com/mozilla/sops/releases/download/v$version/sops-v${version}.linux
chmod +x /usr/local/bin/sops
sops --version
