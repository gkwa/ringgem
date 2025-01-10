#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

set -e

curl -fsSL https://raw.githubusercontent.com/gkwa/alittlepaintball/e1556357343e7a2669a1f4ca8e0ee99650d03c6d/002-homebrew-configured.sh | bash
