#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

curl -fsSL https://get.docker.com/ | sh
systemctl start docker.service
docker run hello-world

docker --version >/dev/null
