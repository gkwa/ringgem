#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

git clone https://github.com/taylormonacelli/onejuly.git
cd onejuly
task --dry

task
