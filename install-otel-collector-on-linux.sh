#!/usr/bin/env bash

# https://opentelemetry.io/docs/collector/installation/#manual-linux-installation

if command -v apt-get &>/dev/null; then
    regex='otelcol_.*linux_amd64.deb'
    package_manager="apt-get"
    install_cmd="sudo dpkg -i"
elif command -v rpm &>/dev/null; then
    regex='otelcol_.*linux_amd64.rpm'
    package_manager="rpm"
    install_cmd="sudo yum localinstall -y"
else
    echo "Unable to determine the package manager."
    exit 1
fi

url=$(/home/linuxbrew/.linuxbrew/bin/allbranding query --releases-url=https://api.github.com/repos/open-telemetry/opentelemetry-collector-releases/releases --asset-regex=$regex | jq -r .browser_download_url)
curl -fsSLO $url
package=$(basename $url)

$install_cmd $package

otelcol --version >/dev/null

rm -f $package
