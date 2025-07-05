#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

# https://ubuntu.com/tutorials/how-to-run-docker-inside-lxd-containers

CONTAINER_NAME="demo"
STORAGE_POOL="docker"
VOLUME_NAME="demo"
VOLUME_SIZE="10GB"
UBUNTU_VERSION="22.04"

# Check system environment and capabilities
echo "Checking system environment..."
systemd-detect-virt || echo "Not in a virtualized environment"

# Check if we're in a container
if [ -f /.dockerenv ]; then
    echo "Running inside Docker container"
elif [ -n "${container:-}" ]; then
    echo "Running inside container: ${container}"
fi

# Check kernel capabilities
echo "Checking kernel capabilities..."
cat /proc/sys/kernel/unprivileged_userns_clone 2>/dev/null || echo "unprivileged_userns_clone not available"

# Check if user namespaces are available
echo "Checking user namespaces..."
unshare --user --pid --mount-proc echo "User namespaces working" 2>/dev/null || echo "User namespaces not available"

# Check incus daemon status
echo "Checking incus daemon status..."
incus info || echo "Incus daemon not responding properly"

# Clean up any existing container with the same name
echo "Cleaning up existing container if it exists..."
incus stop $CONTAINER_NAME --force 2>/dev/null || true
incus delete $CONTAINER_NAME 2>/dev/null || true

# Try to create storage pool (ignore if it already exists)
echo "Creating storage pool..."
incus storage create $STORAGE_POOL dir 2>/dev/null || echo "Storage pool $STORAGE_POOL already exists or failed to create"

# Check if we're running in a nested environment and adjust security settings
echo "Checking for nested virtualization environment..."
if systemd-detect-virt | grep -q "lxc\|docker\|container"; then
    echo "Detected nested environment. Setting up profile for nested containers..."

    # Create a profile for nested containers with comprehensive security bypasses
    incus profile create nested 2>/dev/null || echo "Profile 'nested' already exists"
    incus profile set nested security.nesting true
    incus profile set nested security.privileged true
    incus profile set nested security.syscalls.intercept.mknod true
    incus profile set nested security.syscalls.intercept.setxattr true
    # Disable AppArmor for the container using the correct LXC configuration
    incus profile set nested raw.lxc "lxc.apparmor.profile=unconfined"

    PROFILE_ARG="--profile nested"
else
    PROFILE_ARG=""
fi

# List available images first
echo "Available images:"
incus image list images: | head -20

# Try launching with more verbose output
echo "Attempting to launch container..."
if ! incus launch images:ubuntu/$UBUNTU_VERSION $CONTAINER_NAME $PROFILE_ARG --verbose; then
    echo "Failed to launch container. Trying alternative approaches..."

    # Try with different image source
    echo "Trying with ubuntu: prefix..."
    if ! incus launch ubuntu:$UBUNTU_VERSION $CONTAINER_NAME $PROFILE_ARG --verbose; then
        echo "Still failed. Let's check what's available locally..."
        incus image list

        # Try pulling image first
        echo "Pulling image manually..."
        if ! incus image copy images:ubuntu/$UBUNTU_VERSION local:; then
            echo "Failed to pull image. Trying with different version..."
            if ! incus launch images:ubuntu/24.04 $CONTAINER_NAME $PROFILE_ARG --verbose; then
                echo "All launch attempts failed. Checking system requirements..."

                # Additional diagnostic information
                echo "=== System Diagnostics ==="
                echo "User ID: $(id)"
                echo "Groups: $(groups)"
                echo "Kernel version: $(uname -r)"
                echo "Available cgroups:"
                ls -la /sys/fs/cgroup/ 2>/dev/null || echo "cgroups not accessible"
                echo "AppArmor status:"
                aa-status 2>/dev/null || echo "AppArmor not available or not accessible"
                echo "Incus daemon logs (last 20 lines):"
                journalctl -u incus -n 20 --no-pager 2>/dev/null || echo "Cannot access incus logs"

                echo "Container creation is not working in this environment."
                echo "This might be due to:"
                echo "1. Insufficient privileges in nested container"
                echo "2. Missing kernel features"
                echo "3. AppArmor or SELinux restrictions"
                echo "4. Resource constraints"
                exit 1
            fi
        else
            # Try launching with locally copied image
            echo "Trying to launch with locally copied image..."
            if ! incus launch local:ubuntu/$UBUNTU_VERSION $CONTAINER_NAME $PROFILE_ARG --verbose; then
                echo "Failed even with local image. Container creation not possible."
                exit 1
            fi
        fi
    fi
fi

# Apply additional security settings directly to the container
echo "Applying additional security settings to container..."
incus config set $CONTAINER_NAME security.nesting true
incus config set $CONTAINER_NAME security.privileged true
incus config set $CONTAINER_NAME security.syscalls.intercept.mknod true
incus config set $CONTAINER_NAME security.syscalls.intercept.setxattr true
incus config set $CONTAINER_NAME raw.lxc "lxc.apparmor.profile=unconfined"

# Wait for container to be ready
echo "Waiting for container to be ready..."
sleep 5

# Check container status
incus list $CONTAINER_NAME

# Create a new storage volume on the storage pool with specified size
echo "Creating storage volume..."
if ! incus storage volume create $STORAGE_POOL $VOLUME_NAME size=$VOLUME_SIZE; then
    echo "Failed to create storage volume. Continuing without dedicated Docker storage..."
    SKIP_STORAGE=true
else
    SKIP_STORAGE=false
fi

# Attach the storage volume to the container (if created successfully)
if [ "$SKIP_STORAGE" = "false" ]; then
    echo "Attaching storage volume to container..."
    incus config device add $CONTAINER_NAME $STORAGE_POOL disk pool=$STORAGE_POOL source=$VOLUME_NAME path=/var/lib/docker
fi

# Restart the container to apply all the changes
echo "Restarting container to apply all security changes..."
incus restart $CONTAINER_NAME

# Wait for restart
sleep 10

# Verify the storage setup
if [ "$SKIP_STORAGE" = "false" ]; then
    echo "Verifying storage setup..."
    incus exec $CONTAINER_NAME -- df -h /var/lib/docker
    incus storage info $STORAGE_POOL
fi

echo "Setup complete. Container '$CONTAINER_NAME' is ready."

# Create Docker installation script with comprehensive AppArmor handling
cat >install-docker.sh <<'EOF'
#!/bin/bash

# Check if AppArmor is causing issues and disable it if necessary
if aa-status 2>/dev/null | grep -q "apparmor module is loaded"; then
    echo "AppArmor is active. Disabling AppArmor service to prevent conflicts..."
    sudo systemctl stop apparmor || true
    sudo systemctl disable apparmor || true
    # Also try to unload problematic profiles
    sudo aa-teardown 2>/dev/null || true
fi

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

# Configure Docker daemon BEFORE installation to avoid AppArmor conflicts
echo "Pre-configuring Docker daemon for nested environment..."
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json > /dev/null <<DOCKEREOF
{
    "apparmor-profile": "",
    "security-opt": [
        "apparmor=unconfined"
    ],
    "iptables": false
}
DOCKEREOF

# Install Docker with DEBIAN_FRONTEND=noninteractive to avoid interactive prompts
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install --assume-yes docker-ce docker-ce-cli containerd.io

# Ensure services are stopped before making changes
sudo systemctl stop docker || true
sudo systemctl stop containerd || true

# Start services in correct order
sudo systemctl start containerd
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl enable containerd

# Wait for Docker to fully start
sleep 10

# Test Docker installation
echo "Testing Docker installation..."
if sudo docker run --rm hello-world; then
    echo "✓ Docker is working correctly!"
else
    echo "✗ Docker test failed. Trying with explicit security options..."
    if sudo docker run --rm --security-opt apparmor=unconfined hello-world; then
        echo "✓ Docker works with explicit security options"
        echo "Note: You may need to add '--security-opt apparmor=unconfined' to docker run commands"
    else
        echo "✗ Docker still failing. Checking system status..."
        echo "=== Docker Daemon Status ==="
        sudo systemctl status docker --no-pager -l
        echo "=== Docker Daemon Logs ==="
        sudo journalctl -u docker -n 20 --no-pager
        echo "=== Container Runtime Info ==="
        sudo docker info 2>&1 | head -20 || echo "Docker info failed"
        echo "=== AppArmor Status ==="
        sudo aa-status 2>/dev/null || echo "AppArmor not accessible"
    fi
fi

# Check running processes
ps aux | grep -E "(docker|containerd)" || echo "No Docker processes found"
EOF

echo "Pushing Docker installation script to container..."
incus file push install-docker.sh $CONTAINER_NAME/tmp/install-docker.sh

echo "Installing Docker inside the container..."
incus exec $CONTAINER_NAME -- bash -x /tmp/install-docker.sh

echo "Creating AppArmor fix script for future use..."
cat >fix-docker-apparmor.sh <<'EOF'
#!/usr/bin/env bash

echo "Comprehensive Docker AppArmor fix..."

# Stop all Docker services
sudo systemctl stop docker
sudo systemctl stop containerd

# Disable AppArmor completely within the container
sudo systemctl stop apparmor || true
sudo systemctl disable apparmor || true
sudo aa-teardown 2>/dev/null || true

# Configure Docker daemon with comprehensive security settings
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json > /dev/null <<DOCKEREOF
{
    "apparmor-profile": "",
    "security-opt": [
        "apparmor=unconfined"
    ],
    "iptables": false,
    "userland-proxy": false
}
DOCKEREOF

# Restart services
sudo systemctl start containerd
sudo systemctl start docker

# Wait and test
sleep 10
sudo docker run --rm hello-world
EOF

incus file push fix-docker-apparmor.sh $CONTAINER_NAME/tmp/fix-docker-apparmor.sh
echo "Comprehensive fix script available at /tmp/fix-docker-apparmor.sh inside the container"
