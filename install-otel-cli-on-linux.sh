#!/usr/bin/env bash

# https://github.com/equinix-labs/otel-cli
# https://github.com/equinix-labs/otel-cli/releases

[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

url=$(/home/linuxbrew/.linuxbrew/bin/allbranding query --releases-url=https://api.github.com/repos/equinix-labs/otel-cli/releases --asset-regex='otel-cli.*_linux_amd64.tar.gz' | jq -r .browser_download_url)
curl -fsSL $url | tar -tz
curl -fsSL $url | tar --no-same-owner -C /usr/local/bin -xz otel-cli

otel-cli --help >/dev/null
