#!/usr/bin/env bash
set -e

HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
HOMEBREW_SHELLENV_COMMAND='eval "$('${HOMEBREW_PREFIX}'/bin/brew shellenv)"'

# Function to install required packages
install_packages() {
    if command -v apt-get &>/dev/null || command -v apt &>/dev/null; then
        apt-get update
        sudo apt-get install --assume-yes build-essential procps curl file git
    elif [ -f /etc/fedora-release ] || [ -f /etc/centos-release ] || [ -f /etc/redhat-release ]; then
        sudo yum -y groupinstall 'Development Tools'
        sudo yum -y install procps-ng curl file git
    elif [ -f /etc/arch-release ]; then
        sudo pacman -S base-devel procps-ng curl file git
    else
        echo "Unsupported distribution"
        exit 1
    fi
}

# Function to setup linuxbrew user
setup_linuxbrew_user() {
    if ! id -u linuxbrew &>/dev/null; then
        sudo useradd --create-home linuxbrew --shell /bin/bash
    fi
    if ! test -f /etc/sudoers.d/linuxbrew; then
        echo "linuxbrew ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/linuxbrew
    fi
}

# Function to add Homebrew shellenv to a file
add_homebrew_shellenv() {
    local file="$1"
    if ! grep -q "Setup Homebrew if it exists" "$file"; then
        echo "
# Setup Homebrew if it exists
if [ -d \"$HOMEBREW_PREFIX\" ]; then
    $HOMEBREW_SHELLENV_COMMAND
else
    echo \"Homebrew is not installed in the expected location.\" >&2
fi" >> "$file"
        echo "Updated $file with Homebrew shellenv"
    else
        echo "Homebrew shellenv already exists in $file, skipping."
    fi
}

# Function to create and execute Homebrew installation script
install_homebrew() {
    local script=$(mktemp /tmp/homebrew-XXXXX.sh)
    chmod a+rx $script
    cat >$script <<EOF
# Wait for dns
timeout 30s curl --retry 9999 --connect-timeout 1 -sSf https://www.google.com >/dev/null
export PATH=${HOMEBREW_PREFIX}/bin:\$PATH # suppress warning
NONINTERACTIVE=1 /bin/bash -c "\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$HOMEBREW_SHELLENV_COMMAND
if ! grep HOMEBREW_AUTO_UPDATE_SECS ~/.profile; then
  echo 'export HOMEBREW_AUTO_UPDATE_SECS=\$((24*60*60)) # 1 day' >> ~/.profile
fi
brew --version
EOF
    cd /home/linuxbrew
    if [ ! -f "${HOMEBREW_PREFIX}/bin/brew" ]; then
        sudo --login --user linuxbrew bash -e $script
    else
        echo "Homebrew is already installed. Skipping installation."
    fi
    rm -f $script
}

# Main execution
install_packages
setup_linuxbrew_user
install_homebrew

# Update shell environment
if [ -f "${HOMEBREW_PREFIX}/bin/brew" ]; then
    eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
else
    echo "Homebrew installation seems to have failed. Please check the logs."
    exit 1
fi

# Update initialization files
add_homebrew_shellenv ~/.bashrc
add_homebrew_shellenv ~/.profile
add_homebrew_shellenv "/etc/skel/.profile"
add_homebrew_shellenv "/etc/skel/.bashrc"
add_homebrew_shellenv "/root/.profile"
add_homebrew_shellenv "/root/.bashrc"
add_homebrew_shellenv "/home/linuxbrew/.bashrc"
add_homebrew_shellenv "/home/linuxbrew/.profile"

echo "Homebrew installation, skel file updates, and root initialization file updates completed successfully."
