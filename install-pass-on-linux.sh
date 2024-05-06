#!/usr/bin/env bash

if command -v apt-get &> /dev/null; then
   sudo apt-get --assume-yes install pass
elif command -v yum &> /dev/null; then
   sudo yum install pass
elif command -v zypper &> /dev/null; then
   sudo zypper in password-store
elif command -v emerge &> /dev/null; then
   emerge -av pass
elif command -v pacman &> /dev/null; then
   pacman -S pass
elif command -v brew &> /dev/null; then
   brew install pass
elif command -v pkg &> /dev/null; then
   pkg install password-store
else
   echo "Unsupported package manager. Please install password-store manually."
fi
