#!/usr/bin/env bash

rm -rf /tmp/wait4x
curl -LO https://github.com/wait4x/wait4x/releases/latest/download/wait4x-linux-amd64.tar.gz
tar -xf wait4x-linux-amd64.tar.gz -C /tmp
sudo mv /tmp/wait4x /usr/local/bin/
wait4x version
rm -f wait4x-linux-amd64.tar.gz
