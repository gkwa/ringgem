#!/usr/bin/env bash

rm -f /tmp/kind

version=$(curl -s https://api.github.com/repos/kubernetes-sigs/kind/releases/latest | jq -r '.tag_name')
curl -Lo /tmp/kind https://kind.sigs.k8s.io/dl/${version}/kind-linux-amd64
install -o root -g root -m 775 /tmp/kind /usr/local/bin/kind

kind version

rm -f /tmp/kind
