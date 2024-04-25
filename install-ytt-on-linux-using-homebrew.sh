#!/usr/bin/env bash

sudo --user linuxbrew --login brew tap carvel-dev/carvel
sudo --user linuxbrew --login brew install ytt

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

ytt --version >/dev/null
