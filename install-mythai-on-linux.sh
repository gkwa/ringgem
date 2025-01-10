#!/usr/bin/env bash

[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

[[ -f /opt/mythai/.venv/bin/activate ]] && exit 0

git clone https://github.com/taylormonacelli/mythai.git /opt/mythai

uv sync --project=/opt/mythai/pyproject.toml

. /opt/mythai/.venv/bin/activate
mythai --help
