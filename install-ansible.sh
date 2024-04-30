#!/usr/bin/env bash

if python3 -m pip install ansible; then
exit 0
fi

if pip install ansible; then
exit 0
fi

pip3 install ansible
