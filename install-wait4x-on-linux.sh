#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

cd /tmp
rm -rf /tmp/wait4x
curl -LO https://github.com/wait4x/wait4x/releases/latest/download/wait4x-linux-amd64.tar.gz
tar -xf wait4x-linux-amd64.tar.gz -C /tmp
sudo mv /tmp/wait4x /usr/local/bin/
rm -f wait4x-linux-amd64.tar.gz
wait4x version
