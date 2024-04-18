#!/usr/bin/env bash

. "$HOME/.cargo/env"

export PATH=/root/.cargo/bin:$PATH

# https://github.com/cargo-bins/cargo-binstall?tab=readme-ov-file#quickly
curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

cargo binstall --strategies crate-meta-data jj-cli --no-confirm

jj --version
