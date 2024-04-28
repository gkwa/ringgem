#!/usr/bin/env bash

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

declare -A packages=(
    ["awscli@2"]="aws --version"
    ["bash-completion@2"]=""
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
    ["packer-completion"]=""
    ["packer"]="packer --version"
    ["restic"]="restic version"
    ["ripgrep"]="rg --version"
    ["taylormonacelli/homebrew-tools/cloudelf"]="cloudelf --help"
    ["terragrunt"]="terragrunt --version"
)

for package in "${!packages[@]}"; do
    if ! brew list "$package" >/dev/null 2>&1; then
        sudo --user linuxbrew --login brew install "$package"
    fi
done

for package in "${!packages[@]}"; do
    version_command="${packages[$package]}"
    if [[ -n $version_command ]]; then
        eval "$version_command"
    fi
done
