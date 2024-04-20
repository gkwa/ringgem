#!/usr/bin/env bash

pip install --upgrade git+https://github.com/taylormonacelli/kindsealion
kindsealion --help
# normal run doesn't take any args:
kindsealion --outdir=scratch
cd scratch/
task --list-all
task 017_jaunty_jaguar
