#!/usr/bin/env bash

[[ -f /opt/mythai/.venv/bin/activate ]] && exit 0

git clone https://github.com/taylormonacelli/mythai.git /opt/mythai

uv sync --project=/opt/mythai/pyproject.toml

. /opt/mythai/.venv/bin/activate
mythai --help
