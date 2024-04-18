#!/usr/bin/env bash

export PATH=$PATH:$(/usr/local/go/bin/go env GOPATH)/bin

/usr/local/go/bin/go install mvdan.cc/gofumpt@latest

gofumpt --version
