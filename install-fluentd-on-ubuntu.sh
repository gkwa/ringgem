#!/usr/bin/env bash

[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh
export DEBIAN_FRONTEND=noninteractive

# Detect OS and version
if [ -f /etc/os-release ]; then
    . /etc/os-release
    VERSION_CODENAME=${VERSION_CODENAME:-$(echo "$VERSION" | grep -oE '\([^)]+\)' | tr -d '()' | tr '[:upper:]' '[:lower:]')}
else
    echo "Error: Cannot detect OS version"
    exit 1
fi

# Build URL
lts_suffix=""
[ "$FLUENT_PACKAGE_LTS" = "true" ] && lts_suffix="-lts"

case "$ID" in
    ubuntu)
        case "$VERSION_CODENAME" in
            noble|jammy|focal)
                url="https://toolbelt.treasuredata.com/sh/install-ubuntu-${VERSION_CODENAME}-fluent-package5${lts_suffix}.sh"
                ;;
            *)
                echo "Error: Unsupported Ubuntu version: $VERSION_CODENAME"
                exit 1
                ;;
        esac
        ;;
    debian)
        case "$VERSION_CODENAME" in
            bookworm|bullseye)
                url="https://toolbelt.treasuredata.com/sh/install-debian-${VERSION_CODENAME}-fluent-package5${lts_suffix}.sh"
                ;;
            *)
                echo "Error: Unsupported Debian version: $VERSION_CODENAME"
                exit 1
                ;;
        esac
        ;;
    *)
        echo "Error: Unsupported OS: $ID"
        exit 1
        ;;
esac

# Install
echo "Installing fluent-package from: $url"
curl -fsSL "$url" | sh
