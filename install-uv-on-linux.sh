#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

brew install uv

if ! uv tool update-shell --quiet 2>/dev/null; then
    # Check if it's the specific "executable directory not in PATH" error
    error_output=$(uv tool update-shell --quiet 2>&1)
    if [[ "$error_output" == *"executable directory"*"not in PATH"* ]]; then
        echo "Warning: uv executable directory not in PATH, but config files are up-to-date"
        # Continue without failing
    else
        # It's a different error, so fail
        exit 1
    fi
fi
