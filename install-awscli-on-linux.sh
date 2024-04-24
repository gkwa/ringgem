#!/usr/bin/env bash

if command -v apt-get &>/dev/null; then
    orig_dir=$(pwd)
    tmp=$(mktemp -d awscli-XXXX)
    cd $tmp
    curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip
    unzip awscliv2.zip
    sudo ./aws/install
    cd $orig_dir
fi

if command -v yum &>/dev/null; then
    for i in {1..5}; do
        yum -y install awscli && break
        sleep 1
    done
fi

aws --version

rm -rf $tmp
