#!/usr/bin/env bash

# https://github.com/getsops/sops/releases

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

orig_dir=$(pwd)
tmp=$(mktemp -d ./sops-XXXX)
cd $tmp

allbranding query --releases-url=https://api.github.com/repos/getsops/sops/releases --asset-regex='sops.*.linux.amd64' >manifest.json
url=$(cat manifest.json | jq -r .browser_download_url)
version=$(cat manifest.json | jq -r .version)
checksums_url=https://github.com/getsops/sops/releases/download/$version/sops-$version.checksums.txt

curl --fail --silent --show-error --location --output sops-$version.linux.amd64 $url
curl --fail --silent --show-error --location --output checksums.txt $checksums_url

if ! sha256sum --check checksums.txt --ignore-missing; then
    echo "Checksum validation failed"
    exit 1
fi

install --mode 0755 --group root --owner root sops-$version.linux.amd64 /usr/local/bin/sops

sops --version

cd $orig_dir
rm -rf $tmp
