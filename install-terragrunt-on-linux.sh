#!/usr/bin/env bash

tmp=$(mktemp -d ./terragrunt-XXXX)
tg=$tmp/terragrunt

curl -L -o $tg https://github.com/gruntwork-io/terragrunt/releases/latest/download/terragrunt_linux_amd64
chmod +x $tg

if grep -q executable <<<$(file $tg); then
    install --mode 0755 --group root --owner root $tg /usr/local/bin/terragrunt
fi

terragrunt --version >/dev/null

rm -rf $tmp
