#!/usr/bin/env bash

strip_html() {
    sed -e 's/<[^>]*>//g'
}

filter_released() {
    grep -oE 'terraform_[\.[:alnum:]]*$'
}

filter_version() {
    sed -e 's#terraform_##'
}

version=$(
    curl https://releases.hashicorp.com/terraform/ |
        grep -viE 'alpha|beta' |
        strip_html |
        filter_released |
        sort --general-numeric-sort |
        tail -1 |
        filter_version
)
echo $version
mkdir -p /usr/local/src/
curl -sSL -o /usr/local/src/terraform_${version}_linux_amd64.zip https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip
unzip -o -d /usr/local/src/terraform_${version}_linux_amd64 /usr/local/src/terraform_${version}_linux_amd64.zip
ln -fs /usr/local/src/terraform_${version}_linux_amd64/terraform /usr/local/bin/terraform

terraform version >/dev/null
