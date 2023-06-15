#!/usr/bin/env bash

if command -v apt &>/dev/null; then
    curl -fsSL https://get.docker.com/ | sh
elif command -v yum &>/dev/null; then
    yum -y install docker
else
    echo "Neither apt nor yum package manager is available."
fi

systemctl start docker.service
docker run hello-world
