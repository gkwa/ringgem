#!/usr/bin/env bash

apt-get -y install \
        curl \
        libxcb-randr0-dev \
        libxcb-shape0-dev \
        libxcb-xfixes0

rm -f /tmp/jless

version=$(curl -s https://api.github.com/repos/PaulJuliusMartinez/jless/releases/latest | grep tag_name | cut -d: -f2 | tr -d 'v," ') &&
    curl -LO https://github.com/PaulJuliusMartinez/jless/releases/download/v${version}/jless-v${version}-x86_64-unknown-linux-gnu.zip &&
    unzip -o jless-v${version}-x86_64-unknown-linux-gnu.zip -d /tmp/ &&
    install --mode 0755 --owner root --group root /tmp/jless /usr/local/bin/jless
