#!/usr/bin/env bash

git clone https://github.com/taylormonacelli/mythai.git
cd mythai
rye sync
. .venv/bin/activate
mythai --help
