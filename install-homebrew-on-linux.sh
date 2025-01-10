#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

set -e

curl -fsSL https://raw.githubusercontent.com/gkwa/alittlepaintball/4c38463e37dd9a3fffa335b6680ffb28bd930a18/001-homebrew-base.sh | bash
