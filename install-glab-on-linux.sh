#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

# https://gitlab.com/gitlab-org/cli/-/releases

# Set GitLab project ID for gitlab-org/cli
PROJECT_ID=34675721

# Get latest release version and download URL
release_info=$(curl -Ls "https://gitlab.com/api/v4/projects/${PROJECT_ID}/releases/permalink/latest")
version=$(echo "$release_info" | grep -oP '"tag_name":"v\K[^"]+')
base=glab_${version}_Linux_x86_64

url=$(echo "$release_info" | grep -oP '"url":"\K[^"]+' | grep $base.tar.gz | head -1)

# Extract the filename from the URL
filename=$(basename "$url")

# Download the latest release
echo "Downloading ${filename}..."
curl -LO "${url}"

# Set the filename variable
cli_archive="${filename}"
echo "CLI archive downloaded: ${cli_archive}"

mkdir -p /tmp/$base
tar xzf $cli_archive -C /tmp/$base

install --mode 0755 --group root --owner root /tmp/$base/bin/glab /usr/local/bin/glab

rm -rf /tmp/$base

glab version
