#!/usr/bin/env bash

apt-get install --assume-yes incus incus-client incus-extra
incus admin init --auto

incus --version
