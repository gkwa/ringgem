#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

echo "Debugging information:"
echo "---------------------"

echo "PATH:"
echo "$PATH"

echo "Which pip3:"
which pip3

echo "Type pip3:"
type -a pip3

echo "---------------------"

# pip3 install ansible --user
brew install ansible
