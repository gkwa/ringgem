#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

# https://forum.gitlab.com/t/install-zip-unzip/13471/9

# motivation:
# https://github.com/TetraWeb/docker/issues/59

cloud-init status --wait &>/dev/null
