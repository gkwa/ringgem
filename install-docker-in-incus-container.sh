#!/usr/bin/env bash

# https://ubuntu.com/tutorials/how-to-run-docker-inside-lxd-containers

# Create a new btrfs storage pool for Docker
incus storage create docker btrfs

# Create a new LXD instance named "demo"
incus launch images:ubuntu/20.04 demo

# Create a new storage volume on the "docker" storage pool
incus storage volume create docker demo

# Attach the storage volume to the "demo" container
incus config device add demo docker disk pool=docker source=demo path=/var/lib/docker

# Allow nested containers and enable necessary security options for Docker
incus config set demo security.nesting=true security.syscalls.intercept.mknod=true security.syscalls.intercept.setxattr=true

# Restart the "demo" container to apply the changes
incus restart demo

# Enter the container
incus exec demo bash

# Update the package list and install necessary packages
sudo apt-get update
sudo apt-get --assume-yes install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg \
    --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Install the Docker repository
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

# Install Docker
sudo apt-get update
sudo apt-get install --assume-yes docker-ce docker-ce-cli containerd.io

# Run an Ubuntu Docker container
docker run -it ubuntu bash

# Check running processes
ps aux
