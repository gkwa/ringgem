#!/usr/bin/env bash

# https://opentelemetry.io/docs/collector/installation/

set -e
set -u

url=$(/home/linuxbrew/.linuxbrew/bin/allbranding query --releases-url=https://api.github.com/repos/open-telemetry/opentelemetry-collector-releases/releases --asset-regex='otelcol.*linux_amd64.tar.gz' | jq -r .browser_download_url)
curl -fsSL $url | tar --no-same-owner -C /usr/local/bin -xz otelcol-contrib

otelcol-contrib --version >/dev/null
