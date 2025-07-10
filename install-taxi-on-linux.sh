#!/usr/bin/env bash

[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install taxi

taxi --help
