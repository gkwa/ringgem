#!/usr/bin/env bash
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

curl -sSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --batch --yes --dearmor -o /usr/share/keyrings/elastic-keyring.gpg
apt-get --assume-yes install apt-transport-https

elastic_url=https://artifacts.elastic.co/packages/8.x/apt
sources_list_file=/etc/apt/sources.list.d/elastic-8.x.list

elastic_keyring=/usr/share/keyrings/elastic-keyring.gpg
repo_component=stable
repo_distribution=main

repo_line="deb [signed-by=$elastic_keyring] $elastic_url $repo_component $repo_distribution"

# If the line doesn't exist, append it to the file
if [ ! -f "$sources_list_file" ] || ! grep -qxF "$repo_line" "$sources_list_file"; then
    echo "$repo_line" >>"$sources_list_file"
    echo "Repository line added to $sources_list_file"

    apt-get update
fi
