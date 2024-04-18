#!/usr/bin/env bash

/usr/local/go/bin/go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
golangci-lint --version
