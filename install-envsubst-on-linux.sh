#!/usr/bin/env bash

rm -f /tmp/envsubst
curl -o /tmp/envsubst -L https://github.com/a8m/envsubst/releases/latest/download/envsubst-$(uname -s)-$(uname -m)

chmod +x /tmp/envsubst

/tmp/envsubst --version >/dev/null

install --mode 0755 --group root --owner root /tmp/envsubst /usr/local/bin/envsubst

envsubst --version >/dev/null

rm -f /tmp/envsubst
