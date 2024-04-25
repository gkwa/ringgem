#!/usr/bin/env bash

url=$(allbranding query --releases-url=https://api.github.com/repos/kubernetes-sigs/cluster-api/releases --asset-regex=clusterctl-linux-amd64 | jq -r .browser_download_url)
curl -Lo clusterctl $url

install -o root -g root -m 0755 clusterctl /usr/local/bin/clusterctl

rm -f clusterctl

clusterctl version
