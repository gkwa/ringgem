#!/usr/bin/env bash

url=https://github.com/taylormonacelli/fogcrow/releases/latest/download/fogcrow_Linux_x86_64.tar.gz
checksums_url=https://github.com/taylormonacelli/fogcrow/releases/latest/download/checksums.txt
tmp=$(mktemp -d /tmp/fogcrow-XXXX)
orig="$(pwd)"

cd $tmp
curl --fail --silent --show-error --location --output fogcrow_Linux_x86_64.tar.gz $url
curl --fail --silent --show-error --location --output checksums.txt $checksums_url

if ! sha256sum --check checksums.txt --ignore-missing; then
   echo "Checksum validation failed"
   exit 1
fi

tar --extract --gzip --file fogcrow_Linux_x86_64.tar.gz fogcrow
install --mode 0755 fogcrow /usr/local/bin/fogcrow

cd $orig
rm -rf $tmp
fogcrow --help
