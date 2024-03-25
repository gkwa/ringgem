FROM ubuntu:latest

RUN apt-get update
RUN apt-get --assume-yes install curl

WORKDIR /usr/local

RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d && /usr/local/bin/task --version
