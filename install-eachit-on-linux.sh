#!/usr/bin/env bash

url=https://github.com/taylormonacelli/eachit/releases/latest/download/eachit_Linux_x86_64.tar.gz
checksums_url=https://github.com/taylormonacelli/eachit/releases/latest/download/checksums.txt

tmp=$(mktemp -d /tmp/eachit-XXXX)
orig="$(pwd)"
cd $tmp

curl --fail --silent --show-error --location --output eachit_Linux_x86_64.tar.gz $url
curl --fail --silent --show-error --location --output checksums.txt $checksums_url

if ! sha256sum --check checksums.txt --ignore-missing; then
    echo "Checksum validation failed"
    exit 1
fi

tar --extract --gzip --file eachit_Linux_x86_64.tar.gz eachit
install --mode 0755 eachit /usr/local/bin/eachit

cd $orig
rm -rf $tmp

eachit --help
