#!/usr/bin/env bash

url=https://github.com/taylormonacelli/irisqueen/releases/latest/download/irisqueen_Linux_x86_64.tar.gz
checksums_url=https://github.com/taylormonacelli/irisqueen/releases/latest/download/checksums.txt
tmp=$(mktemp -d /tmp/irisqueen-XXXX)
orig="$(pwd)"

cd $tmp
curl --fail --silent --show-error --location --output irisqueen_Linux_x86_64.tar.gz $url
curl --fail --silent --show-error --location --output checksums.txt $checksums_url

if ! sha256sum --check checksums.txt --ignore-missing; then
    echo "Checksum validation failed"
    exit 1
fi

tar --extract --gzip --file irisqueen_Linux_x86_64.tar.gz irisqueen
install --mode 0755 irisqueen /usr/local/bin/irisqueen

cd $orig
rm -rf $tmp
irisqueen --help
