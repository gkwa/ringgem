#!/usr/bin/env bash

rm -f /tmp/envsubst
curl -L https://github.com/a8m/envsubst/releases/latest/download/envsubst-`uname -s`-`uname -m` -o /tmp/envsubst
install --mode 0755 --group root --owner root /tmp/envsubst /usr/local/bin/envsubst
