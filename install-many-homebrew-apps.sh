#!/usr/bin/env bash

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

declare -A packages=(
  ["carvel-dev/carvel/ytt"]="ytt version"
  ["clusterawsadm"]="clusterawsadm version"
  ["clusterctl"]="clusterctl version"
  ["dolt"]="dolt version"
  ["gcc"]="gcc --version"
  ["gofumpt"]="gofumpt --version"
  ["golangci/tap/golangci-lint"]="golangci-lint --version"
  ["helm"]="helm version"
  ["jj"]="jj --version"
  ["jless"]="jless --version"
  ["k9s"]="k9s version"
  ["kcl-lang/tap/kcl"]="kcl version"
  ["kind"]="kind --version"
  ["nvim"]="nvim --version"
  ["opentofu"]="tofu version"
  ["ripgrep"]="rg --version"
  ["terragrunt"]="terragrunt --version"
)

for package in "${!packages[@]}"; do
  if ! brew list "$package" >/dev/null 2>&1; then
    sudo --user linuxbrew --login brew install "$package"
  fi
done

for version_command in "${packages[@]}"; do
  eval "$version_command" >/dev/null
done