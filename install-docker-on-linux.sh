#!/usr/bin/env bash

if grep --quiet --extended-regexp 'ID(_LIKE)?=.*\b(centos|fedora|rhel|amazon)\b' /etc/os-release; then
    yum --assumeyes install docker
else
    curl -fsSL https://get.docker.com/ | sh
fi

systemctl start docker.service
docker run hello-world
