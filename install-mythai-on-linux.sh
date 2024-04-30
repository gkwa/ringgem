#!/usr/bin/env bash

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

git clone https://github.com/taylormonacelli/mythai.git
cd mythai
rye sync
. .venv/bin/activate
mythai --help
