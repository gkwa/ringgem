#!/usr/bin/env bash

set -e

sudo --login --user linuxbrew brew install opentofu

tofu version >/dev/null
