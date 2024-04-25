#!/usr/bin/env bash

sudo --login --user linuxbrew brew install helm

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

helm version
