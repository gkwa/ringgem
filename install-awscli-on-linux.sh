#!/usr/bin/env bash


apt-get update

if command -v apt-get &>/dev/null; then
    for i in {1..5}; do
        DEBIAN_FRONTEND=noninteractive apt-get -y install awscli && break
        sleep 1
    done

    dpkg -s awscli &>/dev/null
elif command -v yum &>/dev/null; then
    for i in {1..5}; do
        yum -y install awscli && break
        sleep 1
    done
else
    echo "Neither apt nor yum package manager is available."
fi

