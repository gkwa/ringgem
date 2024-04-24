#!/usr/bin/env bash

version=$(curl -s https://api.github.com/repos/helm/helm/releases/latest | jq -r .tag_name)
base=helm-${version}-linux-amd64
targz=$base.tar.gz

curl -sSLo /tmp/$targz https://get.helm.sh/$targz
mkdir -p /tmp/$base
tar xzf /tmp/$targz --strip-components=1 -C /tmp/$base
install --mode 755 /tmp/$base/helm /usr/local/bin/helm

helm version
helm repo add stable https://charts.helm.sh/stable
helm search repo stable

rm -rf /tmp/$base
rm -rf /tmp/$targz
