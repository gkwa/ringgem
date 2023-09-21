#!/usr/bin/env bash

sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin
/usr/local/bin/task --version
