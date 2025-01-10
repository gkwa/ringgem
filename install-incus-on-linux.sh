#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

# https://linuxcontainers.org/incus/docs/main/installing/#installing-from-package

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

setup_zabbly_ubuntu_repo() {
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
}

test -f /etc/os-release
if grep --silent Ubuntu <<<"$(grep ^NAME= /etc/os-release)"; then
    setup_zabbly_ubuntu_repo
    apt-get install --assume-yes incus incus-client incus-extra
elif grep --silent 'ID_LIKE=.*\(rhel\|fedora\)' /etc/os-release; then
    install_incus_on_redhat
fi

incus admin init --auto
incus --version
