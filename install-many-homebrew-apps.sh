#!/usr/bin/env bash

cp Brewfile /tmp/Brewfile
chmod +rx /tmp/Brewfile

for i in {1..4}; do 
    sudo --user linuxbrew --login brew bundle --file=/tmp/Brewfile
done
