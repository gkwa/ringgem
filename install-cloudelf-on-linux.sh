#!/usr/bin/env bash

url=https://github.com/taylormonacelli/cloudelf/releases/latest/download/cloudelf_Linux_x86_64.tar.gz
curl -fsSL $url | tar -C /usr/local/bin --no-same-owner -xz cloudelf
