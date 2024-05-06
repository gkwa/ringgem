#!/usr/bin/env bash

# Check the host and perform the corresponding action
case "$(hostname)" in
  "ubuntu" | "debian")
    sudo apt-get --assume-yes install pass
    ;;
  "fedora" | "rhel")
    sudo yum install pass
    ;;
  "opensuse")
    sudo zypper in password-store
    ;;
  "gentoo")
    emerge -av pass
    ;;
  "arch")
    pacman -S pass
    ;;
  "darwin")
    brew install pass
    ;;
  "freebsd")
    pkg install password-store
    ;;
  *)
    echo "Unsupported host. Please install password-store manually."
    ;;
esac
