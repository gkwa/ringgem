#!/usr/bin/env bash

curl -o /tmp/filebeat-installation-configuration.html https://www.elastic.co/guide/en/beats/filebeat/current/filebeat-installation-configuration.html
version=$(cat /tmp/filebeat-installation-configuration.html | grep -oP 'filebeat-\K[\d.]+(?=-amd64\.deb)' | head -n 1)
echo "Latest Filebeat version: $version"
curl -L -o /tmp/filebeat-${version}-amd64.deb https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${version}-amd64.deb
dpkg -i /tmp/filebeat-${version}-amd64.deb
filebeat version
ls /etc/filebeat/filebeat.yml

rm -f /tmp/filebeat-installation-configuration.html 