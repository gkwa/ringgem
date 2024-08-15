#!/usr/bin/env bash

# https://ubuntu.com/tutorials/how-to-run-docker-inside-lxd-containers

CONTAINER_NAME="demo"
STORAGE_POOL="docker"
VOLUME_NAME="demo"
VOLUME_SIZE="5GB"
UBUNTU_VERSION="24.04"

# Create a new btrfs storage pool for Docker
incus storage create $STORAGE_POOL btrfs

# Create a new LXD instance
incus launch images:ubuntu/$UBUNTU_VERSION $CONTAINER_NAME

# Create a new storage volume on the storage pool with specified size
incus storage volume create $STORAGE_POOL $VOLUME_NAME size=$VOLUME_SIZE

# Attach the storage volume to the container
incus config device add $CONTAINER_NAME $STORAGE_POOL disk pool=$STORAGE_POOL source=$VOLUME_NAME path=/var/lib/docker

# Allow nested containers and enable necessary security options for Docker
incus config set $CONTAINER_NAME security.nesting=true security.syscalls.intercept.mknod=true security.syscalls.intercept.setxattr=true

# Restart the container to apply the changes
incus restart $CONTAINER_NAME

# Verify the storage setup
echo "Verifying storage setup..."
incus exec $CONTAINER_NAME -- df -h /var/lib/docker

incus storage info $STORAGE_POOL


echo "Setup complete. Container '$CONTAINER_NAME' is ready with a $VOLUME_SIZE Docker storage volume."
cat >install-docker.sh <<'EOF'
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
EOF

incus file push install-docker.sh $CONTAINER_NAME/tmp/install-docker.sh

incus exec $CONTAINER_NAME -- bash -x /tmp/install-docker.sh
