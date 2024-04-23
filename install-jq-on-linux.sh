#!/usr/bin/env bash

function install_jq_without_pm {
    version=$(curl -s https://api.github.com/repos/jqlang/jq/releases/latest | grep tag_name | cut -d'"' -f4)
    kernel=$(uname)

    if [[ $kernel == Darwin ]]; then
        if [[ $(uname -m) == arm64 ]]; then
            binary=jq-macos-arm64
        else
            binary=jq-macos-amd64
        fi
    elif [[ $kernel == Linux ]]; then
        if [[ $(uname -m) == x86_64 ]]; then
            binary=jq-linux-amd64
        elif [[ $(uname -m) == aarch64 ]]; then
            binary=jq-linux-arm64
        elif [[ $(uname -m) == armv7l ]]; then
            binary=jq-linux-armhf
        elif [[ $(uname -m) == i686 ]]; then
            binary=jq-linux-i386
        else
            echo Unsupported architecture: $(uname -m)
            return 1
        fi
    else
        echo Unsupported operating system: $kernel
        return 1
    fi

    echo Installing jq $version for $kernel $(uname -m)

    curl -Lo /tmp/$binary https://github.com/jqlang/jq/releases/download/$version/$binary
    install --mode 0755 --owner root --group root /tmp/$binary /usr/local/bin/jq
    rm /tmp/$binary

    jq --version
}

function install_jq_with_pm {
    if command -v apt-get &>/dev/null; then
        sudo apt-get update
        sudo apt-get install -y jq
    elif command -v yum &>/dev/null; then
        sudo yum install -y jq
    elif command -v dnf &>/dev/null; then
        sudo dnf install -y jq
    elif command -v pacman &>/dev/null; then
        sudo pacman -Sy jq
    elif command -v zypper &>/dev/null; then
        sudo zypper install -y jq
    elif command -v brew &>/dev/null; then
        brew install jq
    else
        echo "No supported package manager found. Please install jq manually."
        return 1
    fi

    jq --version >/dev/null
}

if ! install_jq_with_pm; then
    install_jq_without_pm
fi

jq --version >/dev/null
