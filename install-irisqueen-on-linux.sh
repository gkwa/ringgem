#!/usr/bin/env bash

curl -L -o /tmp/irisqueen_Linux_x86_64.tar.gz https://github.com/taylormonacelli/irisqueen/releases/latest/download/irisqueen_Linux_x86_64.tar.gz
rm -f /tmp/irisqueen
tar xzf /tmp/irisqueen_Linux_x86_64.tar.gz -C /tmp
sudo install --mode 0755 --group root --owner root /tmp/irisqueen /usr/local/bin/irisqueen
