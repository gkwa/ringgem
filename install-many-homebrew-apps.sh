#!/usr/bin/env bash

cp Brewfile /tmp/Brewfile
chmod +rx /tmp/Brewfile

sudo --user linuxbrew --login brew bundle --file=/tmp/Brewfile
