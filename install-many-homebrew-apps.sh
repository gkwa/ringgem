#!/usr/bin/env bash

if set +o | grep -q 'set +o xtrace'; then
    old_state=off
else
    old_state=on
fi

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
    ["kubectl"]="kubectl version --output=yaml --client"
    ["logstash"]="jj --version"
    ["nvim"]="nvim --version"
    ["opentofu"]="tofu version"
    ["packer-completion"]=""
    ["packer"]="packer --version"
    ["restic"]="restic version"
    ["ripgrep"]="rg --version"
    ["rye"]="rye --version"
    ["taylormonacelli/homebrew-tools/allbranding"]="allbranding --help"
    ["taylormonacelli/homebrew-tools/cakepalm"]="cakepalm --help"
    ["taylormonacelli/homebrew-tools/cloudelf"]="cloudelf --help"
    ["terragrunt"]="terragrunt --version"
    ["terraform"]="terraform --version"
    ["wget"]="wget --version"
)

for package in "${!packages[@]}"; do
    if ! brew list $package >/dev/null 2>&1; then
        sudo --user linuxbrew --login brew install $package
    fi
done

set +o xtrace

for package in "${!packages[@]}"; do
    version_command="${packages[$package]}"
    if [[ -n $version_command ]]; then
        eval "$version_command"
    fi
done

if [[ $old_state == "on" ]]; then
    set -o xtrace
else
    set +o xtrace
fi
