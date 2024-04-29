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
    ["cilium-cli"]="cilium help"
    ["clusterawsadm"]="clusterawsadm version"
    ["clusterctl"]="clusterctl version"
    ["dolt"]="dolt version"
    ["eachit"]="eachit --help"
    ["gcc"]="gcc --version"
    ["gofumpt"]="gofumpt --version"
    ["golangci/tap/golangci-lint"]="golangci-lint --version"
    ["goreleaser"]="goreleaser --version"
    ["helm"]="helm version"
    ["irisqueen"]="irisqueen help"
    ["jj"]="jj --version"
    ["jless"]="jless --version"
    ["k9s"]="k9s version"
    ["kcl-lang/tap/kcl"]="kcl version"
    ["kind"]="kind --version"
    ["krew"]="kubectl krew version"
    ["kubectl"]="kubectl version --output=yaml --client"
    ["kustomize"]="kustomize version"
    ["logstash"]="jj --version"
    ["nvim"]="nvim --version"
    ["opentofu"]="tofu version"
    ["packer-completion"]=""
    ["packer"]="packer --version"
    ["pip3"]="pip3 --version"
    ["restic"]="restic version"
    ["ripgrep"]="rg --version"
    ["rye"]="rye --version"
    ["sops"]="sops --version"
    ["taylormonacelli/homebrew-tools/allbranding"]="allbranding --help"
    ["taylormonacelli/homebrew-tools/cakepalm"]="cakepalm --help"
    ["taylormonacelli/homebrew-tools/cloudelf"]="cloudelf --help"
    ["taylormonacelli/homebrew-tools/mylime"]="mylime --help"
    ["terraform"]="terraform --version"
    ["terragrunt"]="terragrunt --version"
    ["tflint"]="tflint --version"
    ["tilt"]="tilt version"
    ["timoni"]="timoni --version"
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
