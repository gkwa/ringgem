#!/usr/bin/env bash

curl -sSL https://github.com/taylormonacelli/mylime/releases/latest/download/mylime_Linux_x86_64.tar.gz | tar -C /usr/local/bin --no-same-owner -xz mylime
mylime --help
