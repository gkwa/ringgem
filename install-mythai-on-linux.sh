#!/usr/bin/env bash

export PATH=/home/linuxbrew/.linuxbrew/bin:"$PATH"

if [[ ! -d mythai ]]; then
    git clone https://github.com/taylormonacelli/mythai.git
fi

cd mythai
rye sync
. .venv/bin/activate
mythai --help
