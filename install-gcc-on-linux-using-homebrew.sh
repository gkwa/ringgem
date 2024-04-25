#!/usr/bin/env bash

sudo --user linuxbrew --login brew install gcc

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

gcc --version >/dev/null
