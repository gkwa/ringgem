#!/usr/bin/env bash

version=$(curl -s https://api.github.com/repos/kubernetes-sigs/cluster-api/releases/latest | grep tag_name | cut -d '"' -f 4)
curl -Lo clusterctl https://github.com/kubernetes-sigs/cluster-api/releases/download/$version/clusterctl-linux-amd64
install -o root -g root -m 0755 clusterctl /usr/local/bin/clusterctl
clusterctl version
