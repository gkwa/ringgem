#!/usr/bin/env bash

export PATH=/home/linuxbrew/.linuxbrew/bin:"$PATH"

[[ -f ./mythai/.venv/bin/activate ]] && exit 0

git clone https://github.com/taylormonacelli/mythai.git

rye sync --pyproject=./mythai/pyproject.toml

. ./mythai/.venv/bin/activate
mythai --help
