#!/usr/bin/env bash

curl -fsSL https://get.jetpack.io/devbox | FORCE=1 bash




# cache commonly used stuff to make next run faster
dir=$(mktemp -d /tmp/devbox-XXXX)
devbox init $dir
devbox add awscli2
devbox add git
devbox add ansible
devbox add docker
devbox add go
devbox add python3
devbox install
devbox shell
aws --version




rm -rf $dir
