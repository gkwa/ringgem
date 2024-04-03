#!/usr/bin/env bash

RYE_HOME="$HOME/.rye"
mkdir -p "$RYE_HOME"
curl -sSf https://rye-up.com/get | RYE_INSTALL_OPTION="--yes" RYE_HOME="$RYE_HOME" bash

if [[ ":$PATH:" != *":$RYE_HOME/shims:"* ]]; then
    echo 'export PATH="$RYE_HOME/shims:$PATH"' >>"$HOME/.bashrc"
    source "$HOME/.bashrc"
fi

source "$RYE_HOME/env"
rye --version
