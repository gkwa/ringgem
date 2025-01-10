#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin
/usr/local/bin/task --version
