#!/usr/bin/env bash

# https://opentelemetry.io/docs/collector/installation/

version=$(curl -sSL https://api.github.com/repos/open-telemetry/opentelemetry-collector-releases/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')

if [ -f /etc/debian_version ]; then
  apt-get install -y wget
  wget https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/${version}/otelcol_${version#v}_linux_amd64.deb
  apt-get install -y ./otelcol_${version#v}_linux_amd64.deb
elif [ -f /etc/redhat-release ]; then
  yum -y install wget
  wget https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/${version}/otelcol_${version#v}_linux_amd64.rpm
  yum install -y ./otelcol_${version#v}_linux_amd64.rpm
fi

otelcol --version
