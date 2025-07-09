#!/usr/bin/env bash

[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk version
