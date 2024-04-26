#!/usr/bin/env bash

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

sudo --user linuxbrew --login brew tap golangci/tap
sudo --user linuxbrew --login brew install golangci/tap/golangci-lint
sudo --user linuxbrew --login brew tap carvel-dev/carvel

sudo --user linuxbrew --login brew install \
    clusterawsadm \
    clusterctl \
    dolt \
    gcc \
    gofumpt \
    helm \
    jless \
    k9s \
    kcl-lang/tap/kcl \
    kind \
    ripgrep \
    terragrunt \
    tofu \
    ytt

{
    clusterawsadm version
    dolt version
    gofumpt --version
    gcc --version
    golangci-lint --version
    helm version
    jless --version
    k9s version
    kcl version
    kind --version
    rg --version
    terragrunt --version
    clusterctl version
    ytt --version
    tofu version

} >/dev/null
