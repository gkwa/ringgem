#!/usr/bin/env bash

cat >/tmp/goinstall.sh <<'EOF'
version=$(curl https://go.dev/VERSION?m=text | sed -e 's#go##')
echo $version
curl -Lo /usr/local/src/go${version}.linux-amd64.tar.gz https://go.dev/dl/go${version}.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf /usr/local/src/go${version}.linux-amd64.tar.gz

if ! grep --silent 'PATH=$PATH:/usr/local/go/bin' ~/.profile; then
    echo 'export PATH=$PATH:/usr/local/go/bin' >>~/.profile
fi

if ! grep --silent 'PATH=$PATH:~/go/bin' ~/.profile; then
    echo 'export PATH=$PATH:~/go/bin' >>~/.profile
fi

export PATH=$PATH:/usr/local/go/bin
go version
EOF

export PATH=$PATH:/usr/local/go/bin
bash -u -e -x /tmp/goinstall.sh
