#!/usr/bin/env bash

pushd /usr/local
sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d
/usr/local/bin/task --version
popd
