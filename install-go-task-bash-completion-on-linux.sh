#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

[[ ! -f /etc/os-release ]] && exit 1
[[ -f /usr/share/bash-completion/completions/task ]] && exit 0

curl -sL https://raw.githubusercontent.com/go-task/task/main/completion/bash/task.bash -o /usr/share/bash-completion/completions/task
