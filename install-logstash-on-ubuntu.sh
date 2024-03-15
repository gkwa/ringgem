#!/usr/bin/env bash

# https://www.elastic.co/guide/en/logstash/8.12/installing-logstash.html#_apt

export NEEDRESTART_MODE=a
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elastic-keyring.gpg
apt-get --assume-yes install apt-transport-https
echo "deb [signed-by=/usr/share/keyrings/elastic-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-8.x.list

apt-get update

apt-get --assume-yes install logstash
ln -s /usr/share/logstash/bin/logstash /usr/local/bin/logstash

logstash --version
