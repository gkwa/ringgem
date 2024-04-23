#!/usr/bin/env bash

source /etc/os-release
if [[ $VERSION_ID == "20.04" || $VERSION_ID < "20.04" ]]; then
    echo "jless requires glibc 2.32 or higher, which is not supported on Ubuntu 20.04 or earlier. Please use a newer version of Ubuntu."
    exit 1
fi

apt-get -y install \
    libxcb-randr0-dev \
    libxcb-shape0-dev \
    libxcb-xfixes0

rm -f /tmp/jless
version=$(curl -s https://api.github.com/repos/PaulJuliusMartinez/jless/releases/latest | jq -r '.tag_name')
zip=jless-${version}-x86_64-unknown-linux-gnu.zip

curl -LO https://github.com/PaulJuliusMartinez/jless/releases/download/${version}/$zip
unzip -o $zip -d /tmp/
install --mode 0755 --owner root --group root /tmp/jless /usr/local/bin/jless

jless --version

rm -rf $zip
rm -rf /tmp/jless
