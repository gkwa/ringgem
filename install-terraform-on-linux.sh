#!/usr/bin/env bash

version=$(curl https://releases.hashicorp.com/terraform/ | grep -viE 'alpha|beta' | grep -oE 'terraform_[\.[:alnum:]]*' | sort --general-numeric-sort | tail -1 | cut -d_ -f2)
echo $version
mkdir -p /usr/local/src/
curl -sSL -o /usr/local/src/terraform_${version}_linux_amd64.zip https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip
unzip -o -d /usr/local/src/terraform_${version}_linux_amd64 /usr/local/src/terraform_${version}_linux_amd64.zip
ln -fs /usr/local/src/terraform_${version}_linux_amd64/terraform /usr/local/bin/terraform
