#!/usr/bin/env bash

url=https://github.com/taylormonacelli/goldpuppy/releases/latest/download/goldpuppy_Linux_x86_64.tar.gz
curl -fsSL $url | tar -C /usr/local/bin --no-same-owner -xz goldpuppy
