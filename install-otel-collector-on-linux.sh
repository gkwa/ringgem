#!/usr/bin/env bash

# https://opentelemetry.io/docs/collector/installation/

set -e
set -u

version=$(curl -s https://api.github.com/repos/open-telemetry/opentelemetry-collector-releases/releases/latest | jq -r .tag_name)

if [ -f /etc/debian_version ]; then
    curl -sSL -o otelcol_${version#v}_linux_amd64.deb https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/${version}/otelcol_${version#v}_linux_amd64.deb
    apt-get install -y ./otelcol_${version#v}_linux_amd64.deb
elif [ -f /etc/redhat-release ]; then
    curl -sSL -o otelcol_${version#v}_linux_amd64.rpm https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/${version}/otelcol_${version#v}_linux_amd64.rpm
    yum install -y ./otelcol_${version#v}_linux_amd64.rpm
fi

otelcol --version

rm -f ./otelcol_${version#v}_linux_amd64.deb
rm -f ./otelcol_${version#v}_linux_amd64.rpm
