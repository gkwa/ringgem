#!/usr/bin/env bash

# provides:
# /usr/bin/testscript
# /usr/bin/txtar-addmod
# /usr/bin/txtar-c
# /usr/bin/txtar-goproxy
# /usr/bin/txtar-x

if command -v apt-get &>/dev/null; then
    apt-get --assume-yes install go-internal
else
    go install github.com/rogpeppe/go-internal/cmd/txtar-x@latest
    go install github.com/rogpeppe/go-internal/cmd/txtar-c@latest
    go install github.com/rogpeppe/go-internal/cmd/txtar-goproxy@latest
    go install github.com/rogpeppe/go-internal/cmd/txtar-addmod@latest
    go install github.com/rogpeppe/go-internal/cmd/testscript@latest
fi
