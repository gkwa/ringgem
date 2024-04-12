#!/usr/bin/env bash

git clone --depth 1 https://github.com/taylormonacelli/silverdelay
cd silverdelay
docker compose pull --quiet
