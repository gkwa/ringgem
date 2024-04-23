#!/usr/bin/env bash

apt-get -y install \
 libxcb-randr0-dev \
 libxcb-shape0-dev \
 libxcb-xfixes0

rm -f /tmp/jless
version=$(curl -s https://api.github.com/repos/PaulJuliusMartinez/jless/releases/latest | jq -r '.tag_name')


zip=jless-${version#v}-x86_64-unknown-linux-gnu.zip

curl -LO https://github.com/PaulJuliusMartinez/jless/releases/download/${version}/$zip
unzip -o $zip -d /tmp/
install --mode 0755 --owner root --group root /tmp/jless /usr/local/bin/jless

jless --version


rm -f $zip
