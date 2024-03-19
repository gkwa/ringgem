#!/usr/bin/env bash

# https://www.elastic.co/guide/en/logstash/8.12/installing-logstash.html#_apt

export DEBIAN_FRONTEND=noninteractive
export NEEDRESTART_MODE=a
export NEEDRESTART_SUSPEND=1

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --batch --yes --dearmor -o /usr/share/keyrings/elastic-keyring.gpg
apt-get --assume-yes install apt-transport-https
echo "deb [signed-by=/usr/share/keyrings/elastic-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-8.x.list

apt-get update

apt-get --assume-yes install logstash
ln --force --symbolic /usr/share/logstash/bin/logstash /usr/local/bin/logstash

logstash --version
