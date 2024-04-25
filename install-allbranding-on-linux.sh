#!/usr/bin/env bash

url=https://github.com/taylormonacelli/allbranding/releases/latest/download/allbranding_Linux_x86_64.tar.gz
checksums_url=https://github.com/taylormonacelli/allbranding/releases/latest/download/checksums.txt

tmp=$(mktemp -d /tmp/allbranding-XXXX)
orig="$(pwd)"

cd $tmp

curl --fail --silent --show-error --location --output allbranding_Linux_x86_64.tar.gz $url
curl --fail --silent --show-error --location --output checksums.txt $checksums_url

if ! sha256sum --check checksums.txt --ignore-missing; then
  echo "Checksum validation failed"
  exit 1
fi

tar --extract --gzip --file allbranding_Linux_x86_64.tar.gz allbranding
install --mode 0755 allbranding /usr/local/bin/allbranding

cd $orig
rm -rf $tmp

allbranding --help
