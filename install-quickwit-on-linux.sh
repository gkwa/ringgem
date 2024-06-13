#!/usr/bin/env bash

# https://quickwit.io/docs/get-started/quickstart
# https://github.com/quickwit-oss/quickwit/releases
# https://github.com/quickwit-oss/quickwit?tab=readme-ov-file#cloud-native-search-engine-for-observability-logs-traces-and-soon-metrics-an-open-source-alternative-to-datadog-elasticsearch--loki-and-tempo

tmp=$(mktemp -d /tmp/quickwit-XXXX)
cd $tmp

rel_url=https://api.github.com/repos/quickwit-oss/quickwit/releases
allbranding query --releases-url=$rel_url \
    --asset-regex='quickwit-v.*-x86_64-unknown-linux-gnu.tar.gz' >manifest.json

url=$(cat manifest.json | jq -r .browser_download_url)
version=$(cat manifest.json | jq -r .version)

gz=quickwit-${version}-x86_64-unknown-linux-gnu.tar.gz

echo url:$url
echo version:$version

curl -Lo $gz $url
tar xzf $gz
find quickwit-${version}
install --mode 0755 quickwit-${version}/quickwit /usr/local/bin/quickwit
quickwit --version

mkdir -p /etc/quickwit
cp quickwit-${version}/config/quickwit.yaml /etc/quickwit

cd
rm -rf $tmp
