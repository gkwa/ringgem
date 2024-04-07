#!/usr/bin/evn bash

if [[ -x "$(command -v apt-get)" ]]; then
    apt-get install --assume-yes bash-completion
    apt-get upgrade --assume-yes bash-completion #work around for snap
elif [[ -x "$(command -v yum)" ]]; then
    yum install -y bash-completion
elif [[ -x "$(command -v dnf)" ]]; then
    dnf install -y bash-completion
elif [[ -x "$(command -v zypper)" ]]; then
    zypper --non-interactive install bash-completion
elif [[ -x "$(command -v pacman)" ]]; then
    pacman -Sy --noconfirm bash-completion
elif [[ -x "$(command -v apk)" ]]; then
    apk add bash-completion
else
    echo "Package manager not found. Please install bash-completion manually."
    exit 1
fi
