#!/usr/bin/env bash

# https://github.com/akinomyoga/ble.sh?tab=readme-ov-file#blesh-bl%C9%9B%CA%83-bash-line-editor

# Get latest version/url using allbranding
release_info=$(allbranding query --releases-url=https://api.github.com/repos/akinomyoga/ble.sh/releases --asset-regex='ble-\d+\.\d+(\.\d+)?\.tar\.xz' 2>/dev/null)
url=$(echo "$release_info" | jq -r .browser_download_url)
version=$(echo "$release_info" | jq -r .version)

# Download and extract to unversioned path
install_dir="$HOME/.local/share/blesh"
mkdir -p "$install_dir"
curl -sSL "$url" | tar -C "$install_dir" -xJ --strip-components=1

# Idempotent bashrc updates
bashrc="$HOME/.bashrc"
init_line='if [[ $- == *i* ]]; then source ~/.local/share/blesh/ble.sh --attach=none; fi'
attach_line='if [[ ${BLE_VERSION-} ]]; then ble-attach; fi'

grep -qF "$init_line" "$bashrc" || echo "$init_line" >>"$bashrc"
grep -qF "$attach_line" "$bashrc" || echo "$attach_line" >>"$bashrc"
