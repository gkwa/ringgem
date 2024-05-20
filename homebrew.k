{packages = [
    {
        name = "docker"
        check_installed = "docker --version"
        disabled = True
        note = r"""
        Not using homebrew for docker anymore, using canonical's installer from https://github.com/taylormonacelli/ringgem/blob/master/install-docker-on-linux.sh
        """
    }
    {name = "age", check_installed = "age --version"}
    {name = "aws-cdk", check_installed = "cdk --version"}
    {name = "eachdodge", check_installed = "eachdodge version"}
    {name = "awscli@2", check_installed = "aws --version"}
    {name = "bash-completion@2", check_installed = ""}
    {name = "carvel-dev/carvel/ytt", check_installed = "ytt version"}
    {name = "cdk8s", check_installed = "cdk8s --version"}
    {name = "cilium-cli", check_installed = "cilium version"}
    {name = "cloudeagle", check_installed = "cloudeagle --help"}
    {name = "clusterawsadm", check_installed = "clusterawsadm version"}
    {name = "clusterctl", check_installed = "clusterctl version"}
    {name = "cue", check_installed = "cue version"}
    {name = "dagger", check_installed = "dagger version"}
    {name = "docker-credential-helper", check_installed = "docker-credential-pass version", disabled = True}
    {name = "dolt", check_installed = "dolt version"}
    {name = "gcc", check_installed = "gcc --version"}
    {name = "gh", check_installed = "gh --version"}
    {name = "gofumpt", check_installed = "gofumpt --version"}
    {name = "golang", check_installed = "go version"}
    {name = "golangci/tap/golangci-lint", check_installed = "golangci-lint --version"}
    {name = "goreleaser", check_installed = "goreleaser --version"}
    {name = "helm", check_installed = "helm version"}
    {name = "jj", check_installed = "jj --version"}
    {name = "jless", check_installed = "jless --version"}
    {name = "k9s", check_installed = "k9s version"}
    {name = "kcl-lang/tap/kcl", check_installed = "kcl version"}
    {name = "kind", check_installed = "kind --version"}
    {name = "krew", check_installed = "kubectl krew version"}
    {name = "kubectl", check_installed = "kubectl version --output=yaml --client"}
    {name = "kustomize", check_installed = "kustomize version"}
    {name = "jc", check_installed = "jc --version"}
    {name = "logstash", check_installed = "logstash --version"}
    {name = "lua-language-server", check_installed = "find -L /home/linuxbrew/.linuxbrew/bin/lua-language-server"}
    {name = "lua", check_installed = "lua -v"}
    {name = "mage", check_installed = "mage --version"}
    {name = "minikube", check_installed = "minikube version"}
    {name = "mysql", check_installed = "mysqld --version"}
    {name = "nginx", check_installed = "nginx -v"}
    {name = "nvim", check_installed = "nvim --version"}
    {name = "opentofu", check_installed = "tofu version"}
    {name = "skopeo", check_installed = "skopeo --version"}
    {name = "packer-completion", check_installed = ""}
    {name = "kumactl", check_installed = "kumactl version"}
    {name = "packer", check_installed = "packer --version"}
    {name = "pass", check_installed = "pass --version"}
    {name = "postgresql", check_installed = "postgres --version"}
    {name = "restic", check_installed = "restic version"}
    {name = "ripgrep", check_installed = "rg --version"}
    {name = "ugrep", check_installed = "ugrep --version"}
    {name = "rqlite", check_installed = "rqlite --version"}
    {name = "rye", check_installed = "rye --version"}
    {name = "shellcheck", check_installed = "shellcheck --version"}
    {name = "shfmt", check_installed = "shfmt --version"}
    {name = "sops", check_installed = "sops --version"}
    {name = "sqlite3", check_installed = "sqlite3 --version"}
    {name = "stefanprodan/tap/timoni", check_installed = "timoni --version"}
    {name = "taylormonacelli/homebrew-tools/allbranding", check_installed = "/home/linuxbrew/.linuxbrew/bin/allbranding --help"}
    {name = "taylormonacelli/homebrew-tools/cakepalm", check_installed = "cakepalm --help"}
    {name = "taylormonacelli/homebrew-tools/cloudelf", check_installed = "cloudelf --help"}
    {name = "taylormonacelli/homebrew-tools/eachit", check_installed = "eachit --help"}
    {name = "taylormonacelli/homebrew-tools/howbob", check_installed = "howbob --help"}
    {name = "taylormonacelli/homebrew-tools/irisqueen", check_installed = "irisqueen --help"}
    {name = "taylormonacelli/homebrew-tools/itmetrics", check_installed = "itmetrics --version"}
    {name = "taylormonacelli/homebrew-tools/mylime", check_installed = "mylime --help"}
    {name = "taylormonacelli/homebrew-tools/myville", check_installed = "myville version"}
    {name = "tektoncd-cli", check_installed = "tkn version"}
    {name = "terraform", check_installed = "terraform --version"}
    {name = "terragrunt", check_installed = "terragrunt --version"}
    {name = "tflint", check_installed = "tflint --version"}
    {name = "tilt", check_installed = "tilt version"}
    {name = "wget", check_installed = "wget --version"}
    {name = "yq", check_installed = "yq --version"}
    {name = "zipkin", check_installed = "command -v zipkin >/dev/null"}
]}
