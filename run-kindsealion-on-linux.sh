#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

set -x

uv tool install --upgrade kindsealion

uv tool update-shell
export PATH="$(uv tool dir --bin):$PATH"

kindsealion --outdir=scratch

cd scratch
last_task=$(task --dir=. --list-all | tail -1 | sed 's/[* :]//g')
task $last_task
