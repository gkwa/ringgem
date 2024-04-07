#!/usr/bin/env bash

upgrade_package() {
   if [[ -x "$(command -v $1)" ]]; then
       $1 $2 $3
   fi
}

upgrade_package apt-get "upgrade --assume-yes" bash-completion
upgrade_package yum "upgrade -y" bash-completion
upgrade_package dnf "upgrade -y" bash-completion
upgrade_package zypper "--non-interactive upgrade" bash-completion
upgrade_package pacman "-Syu --noconfirm" bash-completion
upgrade_package apk "upgrade" bash-completion

if ! command -v bash-completion &> /dev/null; then
   echo "bash-completion is not installed. Please install it manually."
   exit 1
fi
