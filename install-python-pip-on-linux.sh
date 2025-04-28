#!/usr/bin/env bash

# [ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

# Default pip URL
PIP_URL="https://bootstrap.pypa.io/get-pip.py"

# Get Python version
PYTHON_VERSION=$(python3 -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")

# Override URL for Python 3.8
if [[ $PYTHON_VERSION == "3.8" ]]; then
    PIP_URL="https://bootstrap.pypa.io/pip/3.8/get-pip.py"
fi

# Download and run pip installer
curl $PIP_URL -o /tmp/get-pip.py
python3 /tmp/get-pip.py

# Show version info
python3 --version
pip3 --version

type -a pip3
realpath /usr/local/bin/pip3

rm -f /tmp/get-pip.py
