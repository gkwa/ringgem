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
    ["dagger"]="dagger version"
    ["dolt"]="dolt version"
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
    ["restic"]="restic version"
    ["ripgrep"]="rg --version"
    ["rye"]="rye --version"
    ["sops"]="sops --version"
    ["taylormonacelli/homebrew-tools/allbranding"]="allbranding --help"
    ["taylormonacelli/homebrew-tools/cakepalm"]="cakepalm --help"
    ["taylormonacelli/homebrew-tools/cloudelf"]="cloudelf --help"
    ["taylormonacelli/homebrew-tools/eachit"]="eachit --help"
    ["taylormonacelli/homebrew-tools/mylime"]="mylime --help"
    ["terraform"]="terraform --version"
    ["terragrunt"]="terragrunt --version"
    ["tflint"]="tflint --version"
    ["tilt"]="tilt version"
    ["stefanprodan/tap/timoni"]="timoni --version"
    ["wget"]="wget --version"
)

brew_packages=()
for package in "${!packages[@]}"; do
  brew_packages+=("$package")
done

sudo --user linuxbrew --login brew install "${brew_packages[@]}"

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
