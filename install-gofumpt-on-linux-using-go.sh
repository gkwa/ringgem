#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

export PATH=$PATH:$(/usr/local/go/bin/go env GOPATH)/bin

/usr/local/go/bin/go install mvdan.cc/gofumpt@latest

gofumpt --version
