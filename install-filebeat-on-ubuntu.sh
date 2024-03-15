#!/usr/bin/env bash

page_content=$(curl -s "https://www.elastic.co/guide/en/beats/filebeat/current/filebeat-installation-configuration.html")
version=$(echo "$page_content" | grep -oP 'filebeat-\K[\d.]+(?=-amd64\.deb)' | head -n 1)
echo "Latest Filebeat version: $version"
curl -L -o /tmp/filebeat-${version}-amd64.deb https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${version}-amd64.deb
dpkg -i /tmp/filebeat-${version}-amd64.deb
filebeat version
cat /etc/filebeat/filebeat.yml
ls /etc/filebeat/filebeat.yml
