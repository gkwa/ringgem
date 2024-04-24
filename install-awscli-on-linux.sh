#!/usr/bin/env bash

# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

orig_dir=$(pwd)
tmp=$(mktemp -d awscli-XXXX)
cd $tmp
curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip
unzip awscliv2.zip
sudo ./aws/install
cd $orig_dir

aws --version

rm -rf $tmp
