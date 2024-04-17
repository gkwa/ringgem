#!/usr/bin/env bash

. "$HOME/.cargo/env"

# https://github.com/cargo-bins/cargo-binstall?tab=readme-ov-file#quickly
curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
