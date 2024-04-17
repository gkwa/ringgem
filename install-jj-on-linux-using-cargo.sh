#!/usr/bin/env bash

cargo binstall --strategies crate-meta-data jj-cli --no-confirm

jj --version
