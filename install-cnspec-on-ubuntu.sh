#!/usr/bin/env bash

version=$(curl --silent "https://api.github.com/repos/mondoohq/cnquery/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")' | tr -d v) && \
url="https://github.com/mondoohq/cnquery/releases/download/v${version}/cnquery_${version}_linux_amd64.deb" && \
echo $url && \
curl -LO $url && \
dpkg -i cnquery_${version}_linux_amd64.deb && \
cnquery version

version=$(curl --silent "https://api.github.com/repos/mondoohq/cnspec/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")' | tr -d v) && \
url="https://github.com/mondoohq/cnspec/releases/download/v${version}/cnspec_${version}_linux_amd64.deb" && \
echo $url && \
curl -LO $url && \
dpkg -i cnspec_${version}_linux_amd64.deb && \
cnspec version
