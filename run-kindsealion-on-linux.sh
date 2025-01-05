#!/usr/bin/env bash

set -x

pip install --upgrade kindsealion
kindsealion --outdir=scratch

cd scratch
last_task=$(task --dir=. --list-all | tail -1 | sed 's/[* :]//g')
task $last_task
