#!/usr/bin/env bash

pip install --upgrade git+https://github.com/taylormonacelli/kindsealion
kindsealion --help
# normal run doesn't take any args:
kindsealion --outdir=scratch
cd scratch/
last_task=$(task --list-all | task -a | tail -1 | tr -d '*' | tr -d ' ' | tr -d ':')
task $last_task
