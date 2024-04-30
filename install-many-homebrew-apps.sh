#!/usr/bin/env bash

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo --user linuxbrew --login brew bundle Brewfile
