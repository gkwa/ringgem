#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

url=https://github.com/taylormonacelli/giantcloak/releases/latest/download/giantcloak_Linux_x86_64.tar.gz
checksums_url=https://github.com/taylormonacelli/giantcloak/releases/latest/download/checksums.txt
tmp=$(mktemp -d /tmp/giantcloak-XXXX)
orig="$(pwd)"

cd $tmp
curl --fail --silent --show-error --location --output giantcloak_Linux_x86_64.tar.gz $url
curl --fail --silent --show-error --location --output checksums.txt $checksums_url

if ! sha256sum --check checksums.txt --ignore-missing; then
    echo "Checksum validation failed"
    exit 1
fi

tar --extract --gzip --file giantcloak_Linux_x86_64.tar.gz giantcloak
install --mode 0755 giantcloak /usr/local/bin/giantcloak

cd $orig
rm -rf $tmp
giantcloak --help
