#!/usr/bin/env bash

# https://github.com/gruntwork-io/boilerplate/releases

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

version=$(curl -s https://api.github.com/repos/gruntwork-io/boilerplate/releases |
    jq -r '.[] | select(.assets[].name | test("'$binary'")) | .tag_name' |
    sort -rV |
    head -n1)

echo $binary:$version
url="https://github.com/gruntwork-io/boilerplate/releases/download/$version/$binary"
curl -Lo /tmp/$binary $url
install --mode 0755 --owner root --group $group /tmp/$binary /usr/local/bin/boilerplate
boilerplate --version
