#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

rm -f /tmp/envsubst
curl -o /tmp/envsubst -L https://github.com/a8m/envsubst/releases/latest/download/envsubst-$(uname -s)-$(uname -m)

chmod +x /tmp/envsubst

install --mode 0755 --group root --owner root /tmp/envsubst /usr/local/bin/envsubst

/usr/local/bin/envsubst --help >/dev/null

rm -f /tmp/envsubst
