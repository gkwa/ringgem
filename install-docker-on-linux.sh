#!/usr/bin/env bash

curl -fsSL https://get.docker.com/ | sh
systemctl start docker.service
docker run hello-world

docker --version >/dev/null
