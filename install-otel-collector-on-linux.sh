#!/usr/bin/env bash

# https://opentelemetry.io/docs/collector/installation/#manual-linux-installation

set -e
set -u

[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

package_name="otelcol_.*_linux_amd64"
releases_url=https://api.github.com/repos/open-telemetry/opentelemetry-collector-releases/releases

if command -v apt-get &>/dev/null; then
    regex="${package_name}.deb"
    package_manager=apt-get
    install_cmd="sudo dpkg -i"
elif command -v rpm &>/dev/null; then
    regex="${package_name}.rpm"
    package_manager=rpm
    install_cmd="sudo yum localinstall -y"
else
    echo "Unable to determine the package manager."
    exit 1
fi

package_url=$(
    /home/linuxbrew/.linuxbrew/bin/allbranding query \
        --releases-url=$releases_url \
        --asset-regex=$regex | jq -r .browser_download_url
)
curl -fsSLO $package_url
package=$(basename $package_url)

$install_cmd $package

otelcol --version >/dev/null

rm -f $package
