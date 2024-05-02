#!/usr/bin/env bash

# https://opentelemetry.io/docs/collector/installation/#manual-linux-installation

package_name="otelcol_.*_linux_amd64"

if command -v apt-get &>/dev/null; then
    regex="${package_name}.deb"
    package_manager="apt-get"
    install_cmd="sudo dpkg -i"
elif command -v rpm &>/dev/null; then
    regex="${package_name}.rpm"
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
