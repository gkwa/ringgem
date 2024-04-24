-- response.sh --
#!/usr/bin/env bash

url=https://github.com/gruntwork-io/terragrunt/releases/latest/download/terragrunt_linux_amd64
checksums_url=https://github.com/gruntwork-io/terragrunt/releases/latest/download/SHA256SUMS

tmp=$(mktemp -d ./terragrunt-XXXX)
tg=$tmp/terragrunt
orig="$(pwd)"

cd $tmp
curl --fail --silent --show-error --location --output terragrunt_linux_amd64 $url
curl --fail --silent --show-error --location --output SHA256SUMS $checksums_url

if ! sha256sum --check SHA256SUMS --ignore-missing; then
   echo "Checksum validation failed"
   exit 1
fi

chmod +x terragrunt_linux_amd64

install --mode 0755 --group root --owner root terragrunt_linux_amd64 /usr/local/bin/terragrunt

cd $orig
rm -rf $tmp

terragrunt --version >/dev/null