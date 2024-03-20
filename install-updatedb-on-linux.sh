#!/usr/bin/env bash

if command -v apt-get >/dev/null; then
    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get install --assume-yes mlocate
elif command -v yum >/dev/null; then
    yum install --assume-yes mlocate
elif command -v apk >/dev/null; then
    apk add --no-cache mlocate
elif command -v dnf >/dev/null; then
    dnf install --assume-yes mlocate
else
    echo "Unsupported package manager, couldn't install updatedb"
    exit 1
fi
