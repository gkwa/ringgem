#!/usr/bin/env bash

version=$(curl -s https://api.github.com/repos/mondoohq/cnquery/releases/latest | jq -r .tag_name)
url="https://github.com/mondoohq/cnquery/releases/download/${version}/cnquery_${version#v}_linux_amd64.deb"
curl -LO $url
dpkg -i cnquery_${version#v}_linux_amd64.deb

version=$(curl -s https://api.github.com/repos/mondoohq/cnspec/releases/latest | jq -r .tag_name)
url="https://github.com/mondoohq/cnspec/releases/download/${version}/cnspec_${version#v}_linux_amd64.deb"
curl -LO $url
dpkg -i cnspec_${version#v}_linux_amd64.deb

cnquery version
cnspec version

rm -f cnquery_${version#v}_linux_amd64.deb
rm -f cnspec_${version#v}_linux_amd64.deb
