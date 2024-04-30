#!/usr/bin/env bash

export PATH=/home/linuxbrew/.linuxbrew/bin:"$PATH"

pip install --upgrade git+https://github.com/taylormonacelli/kindsealion
kindsealion --outdir=scratch

cd scratch
last_task=$(task --dir=. --list-all | tail -1 | sed 's/[* :]//g')
task $last_task
