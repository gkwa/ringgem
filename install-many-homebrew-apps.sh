#!/usr/bin/env bash

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

packages=(
  carvel-dev/carvel/ytt
  clusterawsadm
  clusterctl
  dolt
  gcc
  gofumpt
  golangci/tap/golangci-lint
  helm
  jj
  jless
  k9s
  kcl-lang/tap/kcl
  kind
  nvim
  opentofu
  ripgrep
  terragrunt
)

for package in "${packages[@]}"; do
  if ! brew list "$package" >/dev/null 2>&1; then
    sudo --user linuxbrew --login brew install "$package"
  fi
done

{
  clusterawsadm version
  clusterctl version
  dolt version
  gcc --version
  gofumpt --version
  golangci-lint --version
  helm version
  jj --version
  jless --version
  k9s version
  kcl version
  kind --version
  nvim --version
  rg --version
  terragrunt --version
  tofu version
  ytt --version
} >/dev/null
