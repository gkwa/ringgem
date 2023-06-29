#!/usr/bin/env bash

curl -Lo /tmp/dulltrader_Linux_x86_64.tar.gz https://github.com/taylormonacelli/dulltrader/releases/latest/download/dulltrader_Linux_x86_64.tar.gz
rm -f /tmp/dulltrader
tar xzf /tmp/dulltrader_Linux_x86_64.tar.gz -C /tmp
install --mode 0755 --group root --owner root /tmp/dulltrader /usr/local/bin/dulltrader
