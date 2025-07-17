#!/bin/bash

# Detect distro and install zfsutils-linux
if [ -f /etc/debian_version ]; then
   apt-get update && apt-get install -y zfsutils-linux
elif [ -f /etc/redhat-release ]; then
   yum install -y https://zfsonlinux.org/epel/zfs-release.el$(rpm -E %rhel).noarch.rpm
   yum install -y zfs
elif [ -f /etc/arch-release ]; then
   pacman -S --noconfirm zfs-utils
elif [ -f /etc/alpine-release ]; then
   apk update && apk add zfs
elif [ -f /etc/SUSE-brand ]; then
   zypper install -y zfs
else
   echo "Unsupported distribution"
   exit 1
fi

modprobe zfs 2>/dev/null || true
echo "ZFS installed successfully"
