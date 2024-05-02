#!/usr/bin/env bash

# https://opentelemetry.io/docs/collector/installation/#manual-linux-installation

url=$(/home/linuxbrew/.linuxbrew/bin/allbranding query --releases-url=https://api.github.com/repos/open-telemetry/opentelemetry-collector-releases/releases --asset-regex='otelcol.*linux_amd64.tar.gz' | jq -r .browser_download_url)
rm -f /tmp/otelcol-contrib
curl -fsSL $url | tar --no-same-owner -C /tmp -xz otelcol-contrib
install --mode 0755 --group root --owner root /tmp/otel-contrib /usr/local/bin/otelcol

otelcol --version >/dev/null

rm -f /tmp/otelcol-contrib
