#!/usr/bin/env bash

sudo --user linuxbrew --login brew tap golangci/tap
sudo --user linuxbrew --login brew install golangci/tap/golangci-lint

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

golangci-lint --version >/dev/null
