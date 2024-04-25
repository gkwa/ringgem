#!/usr/bin/env bash

sudo --login --user linuxbrew brew install clusterctl

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

clusterctl version >/dev/null
