#!/usr/bin/env bash

# https://github.com/equinix-labs/otel-cli
# https://github.com/equinix-labs/otel-cli/releases

version=$(curl -s https://api.github.com/repos/equinix-labs/otel-cli/releases/latest | grep tag_name | cut -d '"' -f 4)
base=otel-cli_$(echo $version | cut -d 'v' -f 2)_linux_amd64
tar=$base.tar.gz
mkdir -p /tmp/$base
curl -Lo /tmp/$base/$tar https://github.com/equinix-labs/otel-cli/releases/download/$version/$tar
tar -xzf /tmp/$base/$tar -C /tmp/$base
install --mode 0755 --group root --owner root /tmp/$base/otel-cli /usr/local/bin/otel-cli
otel-cli --help >/dev/null
rm -rf /tmp/$base
