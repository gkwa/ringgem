#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

if [[ -d silverdelay ]]; then
    cd silverdelay
    git pull
else
    git clone --depth 1 https://github.com/taylormonacelli/silverdelay
    cd silverdelay
fi

docker compose pull --quiet
mylime touch silverdelay
