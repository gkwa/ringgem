#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

uv tool install --python 3.12 chromadb

export PATH="$HOME/.local/bin:$PATH"

chroma --version
