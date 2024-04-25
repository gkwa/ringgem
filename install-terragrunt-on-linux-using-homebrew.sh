#!/usr/bin/env bash

sudo --login --user linuxbrew brew install terragrunt

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

terragrunt --version >/dev/null
