#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

set -e

curl -fsSL https://raw.githubusercontent.com/gkwa/alittlepaintball/ef9167c594fb7d33953ddeef7a84a0c78b1737f7/002-homebrew-configured.sh | bash
