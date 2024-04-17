#!/usr/bin/env bash

go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
golangci-lint --version
