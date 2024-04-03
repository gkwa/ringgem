#!/usr/bin/env bash

set -e
set -x
set -u

export DEBIAN_FRONTEND=noninteractive
export NEEDRESTART_MODE=a
export NEEDRESTART_SUSPEND=1

# workround
if [[ ! -f /tmp/logstash-8.13.0-amd64.deb ]]; then
    curl -L -o /tmp/logstash-8.13.0-amd64.deb https://artifacts.elastic.co/downloads/logstash/logstash-8.13.0-amd64.deb
fi

dpkg -i /tmp/logstash-8.13.0-amd64.deb

ln --force --symbolic /usr/share/logstash/bin/logstash /usr/local/bin/logstash

logstash --version

rm -f /tmp/logstash-8.13.0-amd64.deb

exit 0

# https://www.elastic.co/guide/en/logstash/8.12/installing-logstash.html#_apt

export DEBIAN_FRONTEND=noninteractive
export NEEDRESTART_MODE=a
export NEEDRESTART_SUSPEND=1

apt-get update

apt-get --fix-missing --assume-yes install logstash
ln --force --symbolic /usr/share/logstash/bin/logstash /usr/local/bin/logstash

logstash --version
