{packages = [
    {
        name = "docker"
        check_installed = "docker --version"
        disabled = True
        note = r"""
       Not using homebrew for docker anymore, using canonical's installer from
       https://github.com/taylormonacelli/ringgem/blob/master/install-docker-on-linux.sh
       """
    }
    {name = "age", check_installed = "age --version"}
    {
        name = "atuin"
        check_installed = "atuin --version"
        disabled = True
        note = r"""
        use curl installer instead since it will deploy the correct ~/.bash-preexc.sh that atuin wants
        bash <(curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh)
        """
    }
    {name = "autossh", check_installed = "autossh -V"}
    {name = "aws-cdk", check_installed = "cdk --version", devbox_name = "nodePackages.aws-cdk"}
    {name = "aws-sam-cli", check_installed = "sam --version"}
    {name = "aws-vault", check_installed = "aws-vault --version"}
    {name = "awscli@2", check_installed = "aws --version", devbox_name = "awscli2"}
    {name = "bash-completion@2", check_installed = ""}
    {name = "carvel-dev/carvel/ytt", check_installed = "ytt version"}
    {name = "cdk8s", check_installed = "cdk8s --version", devbox_name = "nodePackages.cdk8s-cli"}
    {name = "chamber", check_installed = "chamber version"}
    {name = "chezmoi", check_installed = "chezmoi --version"}
    {name = "cilium-cli", check_installed = "cilium version"}
    {name = "clusterawsadm", check_installed = "clusterawsadm version"}
    {name = "clusterctl", check_installed = "clusterctl version"}
    {name = "coreutils", check_installed = "gshuf --version"}
    {name = "cosign", check_installed = "cosign version"}
    {name = "cue", check_installed = "cue version"}
    {name = "dagger", check_installed = "dagger version"}
    {name = "direnv", check_installed = "direnv --version"}
    {name = "docker-credential-helper", check_installed = "docker-credential-pass version", disabled = True}
    {name = "doggo", check_installed = "doggo --version"}
    {name = "dolt", check_installed = "dolt version"}
    {name = "duckdb", check_installed = "duckdb -version"}
    {name = "dust", check_installed = "dust --version"}
    {name = "eksctl", check_installed = "eksctl version"}
    {name = "emacs", check_installed = "emacs --version"}
    {name = "fzf", check_installed = "fzf --version"}
    {name = "gcc", check_installed = "gcc --version"}
    {name = "gh", check_installed = "gh --version"}
    {name = "git-delta", check_installed = "delta --version"}
    {name = "gkwa/homebrew-tools/allbranding", check_installed = "allbranding --help"}
    {name = "gkwa/homebrew-tools/cakepalm", check_installed = "cakepalm --help"}
    {name = "gkwa/homebrew-tools/cloudeagle", check_installed = "cloudeagle --help"}
    {name = "gkwa/homebrew-tools/cloudelf", check_installed = "cloudelf --help"}
    {name = "gkwa/homebrew-tools/eachdodge", check_installed = "eachdodge version"}
    {name = "gkwa/homebrew-tools/eachit", check_installed = "eachit --help"}
    {name = "gkwa/homebrew-tools/hercow", check_installed = "hercow version"}
    {name = "gkwa/homebrew-tools/howbob", check_installed = "howbob --help"}
    {name = "gkwa/homebrew-tools/irisqueen", check_installed = "irisqueen --help"}
    {name = "gkwa/homebrew-tools/itmetrics", check_installed = "itmetrics --version"}
    {name = "gkwa/homebrew-tools/mylime", check_installed = "mylime --help"}
    {name = "gkwa/homebrew-tools/myville", check_installed = "myville version"}
    {name = "gkwa/homebrew-tools/ourlock", check_installed = "ourlock version"}
    {name = "glab", check_installed = "glab --version"}
    {name = "glasskube/tap/glasskube", check_installed = "glasskube --help"}
    {name = "gnu-units", check_installed = "units --version"}
    {name = "gofumpt", check_installed = "gofumpt --version"}
    {name = "golang", check_installed = "go version"}
    {name = "golangci/tap/golangci-lint", check_installed = "golangci-lint --version"}
    {name = "gomplate", check_installed = "gomplate --version"}
    {name = "goose", check_installed = "goose --version"}
    {name = "goreleaser", check_installed = "goreleaser --version"}
    {name = "hashicorp/tap/nomad", check_installed = "nomad --version"}
    {name = "hashicorp/tap/packer", check_installed = "packer -version"}
    {name = "helm", check_installed = "helm version"}
    {name = "homeport/tap/dyff", check_installed = "dyff version"}
    {name = "hurl", check_installed = "hurl --version"}
    {name = "jc", check_installed = "jc --version"}
    {name = "jj", check_installed = "jj --version"}
    {name = "jless", check_installed = "jless --version"}
    {name = "just", check_installed = "just --version"}
    {name = "k9s", check_installed = "k9s version"}
    {name = "kcl-lang/tap/kcl", check_installed = "kcl version"}
    {name = "kind", check_installed = "kind --version"}
    {name = "krew", check_installed = "kubectl krew version"}
    {name = "kubectl", check_installed = "kubectl version --output=yaml --client"}
    {name = "kumactl", check_installed = "kumactl version"}
    {name = "kustomize", check_installed = "kustomize version"}
    {name = "logstash", check_installed = "logstash --version"}
    {name = "lua-language-server", check_installed = "find -L /home/linuxbrew/.linuxbrew/bin/lua-language-server"}
    {name = "lua", check_installed = "lua -v"}
    {name = "mage", check_installed = "mage --version"}
    {name = "minikube", check_installed = "minikube version"}
    {name = "mysql", check_installed = "mysqld --version"}
    {name = "nats-server", check_installed = "nats-server --version"}
    {name = "nats-streaming-server", check_installed = "nats-streaming-server --version"}
    {name = "nginx", check_installed = "nginx -v"}
    {name = "nvim", check_installed = "nvim --version"}
    {name = "openbao", check_installed = "bao version"}
    {name = "opentofu", check_installed = "tofu version"}
    {name = "packer-completion", check_installed = ""}
    {name = "pass", check_installed = "pass --version"}
    {name = "pnpm", check_installed = "pnpm --version"}
    {name = "postgresql", check_installed = "postgres --version"}
    {name = "restic", check_installed = "restic version"}
    {name = "ripgrep", check_installed = "rg --version"}
    {name = "rqlite", check_installed = "rqlite --version"}
    {name = "shellcheck", check_installed = "shellcheck --version"}
    {name = "shfmt", check_installed = "shfmt --version"}
    {name = "skopeo", check_installed = "skopeo --version"}
    {name = "sops", check_installed = "sops --version"}
    {name = "sqlc", check_installed = "sqlc version"}
    {name = "sqlite3", check_installed = "sqlite3 --version"}
    {name = "stefanprodan/tap/timoni", check_installed = "timoni --version"}
    {name = "tektoncd-cli", check_installed = "tkn version"}
    {name = "teller", check_installed = "teller --version"}
    {name = "terragrunt", check_installed = "terragrunt --version"}
    {name = "tfenv", check_installed = "out=$(tfenv 2>&1||true); grep -q 'Usage: tfenv <command>' <<<$out"}
    {name = "tflint", check_installed = "tflint --version"}
    {name = "tilt", check_installed = "tilt version"}
    {name = "ugrep", check_installed = "ugrep --version"}
    {name = "watchexec", check_installed = "watchexec --version"}
    {name = "watchman", check_installed = "watchman --version"}
    {name = "wget", check_installed = "wget --version"}
    {name = "xurls", check_installed = "xurls -version"}
    {name = "yq", check_installed = "yq --version"}
    {name = "zipkin", check_installed = "command -v zipkin >/dev/null"}
    {
        name = "findutils"
        check_installed = ""
        disabled = True
        note = r"""
    I don't see a use for findutils by homebrew on linux
   """
    }
    {name = "git", check_installed = "git --version"}
    {name = "git-lfs", check_installed = "git lfs --version"}
    {name = "gmailctl", check_installed = "gmailctl version"}
    {
        name = "guilhem/tap/bump"
        check_installed = ""
        disabled = True
        note = r"""
   does not run on focal


    root@ip-172-31-24-83:~# cat /etc/os-release
    NAME="Ubuntu"
    VERSION="20.04.6 LTS (Focal Fossa)"
    ID=ubuntu
    ID_LIKE=debian
    PRETTY_NAME="Ubuntu 20.04.6 LTS"
    VERSION_ID="20.04"
    HOME_URL="https://www.ubuntu.com/"
    SUPPORT_URL="https://help.ubuntu.com/"
    BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
    PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
    VERSION_CODENAME=focal
    UBUNTU_CODENAME=focal
    root@ip-172-31-24-83:~# bump --help
    bump: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by bump)
    bump: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.32' not found (required by bump)
    root@ip-172-31-24-83:~#

   """
    }
    {name = "jq", check_installed = "jq --version"}
    {name = "meilisearch", check_installed = "meilisearch --version", note = r"""https://www.meilisearch.com/docs/learn/getting_started/installation"""}
    {name = "pipx", check_installed = "pipx --version"}
    {name = "ruff", check_installed = "ruff --version"}
    {name = "shellcheck", check_installed = "shellcheck -V"}
    {name = "syncthing", check_installed = "syncthing --version"}
    {name = "gkwa/tools/manywest", check_installed = "manywest --version"}
    {name = "tmux", check_installed = "tmux -V"}
    {name = "tree", check_installed = "tree --version"}
    {name = "uv", check_installed = "uv --version"}
    {
        name = "z"
        check_installed = ""
        note = r"""
    z requires being added to your path or other setetup
    """
    }
]}
