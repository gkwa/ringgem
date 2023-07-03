#!/usr/bin/env bash

rm -f /tmp/fogcrow
curl -Lo /tmp/fogcrow_Linux_x86_64.tar.gz https://github.com/taylormonacelli/fogcrow/releases/latest/download/fogcrow_Linux_x86_64.tar.gz
tar xzf /tmp/fogcrow_Linux_x86_64.tar.gz -C /tmp
install --mode 0755 --group root --owner root /tmp/fogcrow /usr/local/bin/fogcrow
command fogcrow &>/dev/null && rm -f /tmp/fogcrow_Linux_x86_64.tar.gz
