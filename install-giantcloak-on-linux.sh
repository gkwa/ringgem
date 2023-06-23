#!/usr/bin/env bash

curl -Lo /tmp/giantcloak_Linux_x86_64.tar.gz https://github.com/taylormonacelli/giantcloak/releases/latest/download/giantcloak_Linux_x86_64.tar.gz
tar xzf /tmp/giantcloak_Linux_x86_64.tar.gz -C /tmp
install --mode 0755 --group root --owner root /tmp/giantcloak /usr/local/bin/giantcloak
