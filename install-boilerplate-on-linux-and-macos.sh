#!/usr/bin/env bash

# https://github.com/gruntwork-io/boilerplate/releases
# https://github.com/gruntwork-io/boilerplate?tab=readme-ov-file#install

kernel=$(uname)
if [[ $kernel == Darwin ]]; then
    binary=boilerplate_darwin_amd64
    group=wheel
elif [[ $kernel == Linux ]]; then
    binary=boilerplate_linux_amd64
    group=root
else
    echo Unsupported operating system: $kernel
    exit 1
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

url=$(/usr/local/bin/allbranding query --releases-url=https://api.github.com/repos/gruntwork-io/boilerplate/releases --asset-regex="$binary" | jq -r .browser_download_url)
curl -fsSL -o boilerplate $url
install --mode 0755 boilerplate /usr/local/bin/boilerplate
boilerplate --version
