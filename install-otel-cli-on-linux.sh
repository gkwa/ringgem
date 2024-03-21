#!/usr/bin/env bash

# https://github.com/equinix-labs/otel-cli
# https://github.com/equinix-labs/otel-cli/releases

version=$(curl -s https://api.github.com/repos/equinix-labs/otel-cli/releases/latest | grep tag_name | cut -d '"' -f 4)
tar=otel-cli_$(echo $version | cut -d 'v' -f 2)_linux_amd64.tar.gz
curl -Lo /tmp/$tar https://github.com/equinix-labs/otel-cli/releases/download/$version/$tar
tar -xzf $tar
install --mode 0755 --group root --owner root /tmp/otel-cli /usr/local/bin/otel-cli
rm -f /tmp/$tar
rm -f /tmp/otel-cli
otel-cli --help >/dev/null
