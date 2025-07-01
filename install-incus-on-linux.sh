#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

set -x
set -e
set -u

install_incus_on_redhat() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ "$ID" != "fedora" ]; then
            exit 0
        fi
    fi
    if ! command -v dnf &>/dev/null; then
        echo "Error: dnf is not installed. Please install dnf and try again."
        exit 1
    fi
    if ! dnf list installed "dnf-command(copr)" &>/dev/null; then
        dnf install -y 'dnf-command(copr)'
    fi
    if ! dnf repolist --enabled | grep -q "^ganto/lxc4"; then
        dnf copr enable -y ganto/lxc4
    fi
    dnf install -y incus incus-client incus-extra
}

install_incus_ubuntu_native() {
    # For Ubuntu 24.04+, use native packages
    apt-get update
    apt-get install --assume-yes incus qemu-system
    # Add incus-tools if migrating from LXD
    apt-get install --assume-yes incus-tools || true
}

setup_zabbly_ubuntu_repo() {
    # Only for supported Ubuntu versions (22.04)
    curl -fsSL https://pkgs.zabbly.com/key.asc | gpg --show-keys --fingerprint
    mkdir -p /etc/apt/keyrings/
    curl -fsSL https://pkgs.zabbly.com/key.asc -o /etc/apt/keyrings/zabbly.asc
    cat <<EOF >/etc/apt/sources.list.d/zabbly-incus-stable.sources
Enabled: yes
Types: deb
URIs: https://pkgs.zabbly.com/incus/stable
Suites: $(. /etc/os-release && echo ${VERSION_CODENAME})
Components: main
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/zabbly.asc
EOF
    apt-get update
    apt-get install --assume-yes incus incus-client incus-extra
}

test -f /etc/os-release

if grep --silent Ubuntu <<<"$(grep ^NAME= /etc/os-release)"; then
    . /etc/os-release
    echo "Detected Ubuntu ${VERSION_ID} (${VERSION_CODENAME})"

    case "${VERSION_CODENAME}" in
    "noble" | "mantic" | "lunar")
        # Ubuntu 24.04+ has native incus packages
        echo "Using native Ubuntu incus packages"
        install_incus_ubuntu_native
        ;;
    "jammy")
        # Ubuntu 22.04 - use Zabbly repo
        echo "Using Zabbly repository for Ubuntu 22.04"
        setup_zabbly_ubuntu_repo
        ;;
    "focal" | "bionic")
        # Ubuntu 20.04 and older - EOL for Zabbly packages
        echo "Warning: Ubuntu ${VERSION_CODENAME} is EOL for Incus packages"
        echo "Please upgrade to Ubuntu 22.04+ or skip Incus installation"
        exit 1
        ;;
    *)
        echo "Unsupported Ubuntu version: ${VERSION_CODENAME}"
        exit 1
        ;;
    esac
elif grep --silent 'ID_LIKE=.*\(rhel\|fedora\)' /etc/os-release; then
    install_incus_on_redhat
else
    echo "Unsupported operating system"
    exit 1
fi

incus admin init --auto
incus --version
