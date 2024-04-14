#!/usr/bin/env bash

sudo --login --user linuxbrew brew install clusterawsadm

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
clusterawsadm version
