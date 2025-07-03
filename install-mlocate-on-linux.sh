#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

if command -v apt-get >/dev/null; then
    export DEBIAN_FRONTEND=noninteractive
    # apt-get install --assume-yes mlocate
    apt-get install --assume-yes plocate
elif command -v yum >/dev/null; then
    yum install --assume-yes mlocate
elif command -v apk >/dev/null; then
    apk add --no-cache mlocate
elif command -v dnf >/dev/null; then
    dnf install --assume-yes mlocate
else
    echo "Unsupported package manager, couldn't install mlocate"
    exit 1
fi
