#!/usr/bin/env bash

url=https://github.com/taylormonacelli/dulltrader/releases/latest/download/dulltrader_Linux_x86_64.tar.gz
checksums_url=https://github.com/taylormonacelli/dulltrader/releases/latest/download/checksums.txt
tmp=$(mktemp -d /tmp/dulltrader-XXXX)
orig="$(pwd)"

cd $tmp
curl --fail --silent --show-error --location --output dulltrader_Linux_x86_64.tar.gz $url
curl --fail --silent --show-error --location --output checksums.txt $checksums_url

if ! sha256sum --check checksums.txt --ignore-missing; then
    echo "Checksum validation failed"
    exit 1
fi

tar --extract --gzip --file dulltrader_Linux_x86_64.tar.gz dulltrader
install --mode 0755 dulltrader /usr/local/bin/dulltrader

cd $orig
rm -rf $tmp
dulltrader --help
