#!/usr/bin/env bash

if command -v apt-get &>/dev/null; then
   DEBIAN_FRONTEND=noninteractive apt-get -y install git
elif command -v yum &>/dev/null; then
   yum -y install git
elif command -v dnf &>/dev/null; then
   dnf -y install git
elif command -v zypper &>/dev/null; then
   zypper -n install git
elif command -v apk &>/dev/null; then
   apk add --no-cache git
elif command -v pkg &>/dev/null; then
   pkg install -y git
elif command -v pacman &>/dev/null; then
   pacman -Sy --noconfirm git
else
   echo "No supported package manager is available."
   exit 1
fi
