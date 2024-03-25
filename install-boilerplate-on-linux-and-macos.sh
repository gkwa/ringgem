#!/usr/bin/env bash

version=$(curl -s https://api.github.com/repos/gruntwork-io/boilerplate/releases/latest | grep tag_name | cut -d: -f2 | tr -d 'v," ')

kernel=$(uname)

if [[ "$kernel" == Darwin ]]; then
  binary=boilerplate_darwin_amd64
  group=wheel
elif [[ "$kernel" == Linux ]]; then
  binary=boilerplate_linux_amd64
  group=root
else
  echo Unsupported operating system: $kernel
  exit 1
fi

echo $binary:$version

curl -Lo /tmp/$binary https://github.com/gruntwork-io/boilerplate/releases/download/v$version/$binary

install --mode 0755 --owner root --group $group /tmp/$binary /usr/local/bin/boilerplate

boilerplate --version
