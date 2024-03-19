apt-get -y install wget

url=https://github.com/taylormonacelli/cakepalm/releases/latest/download/cakepalm_Linux_x86_64.tar.gz
curl -fsSL $url | tar -C /usr/local/bin --no-same-owner -xz cakepalm

cat >/usr/lib/systemd/system/cakepalm.service <<'EOF'
[Unit]
Description=Cakepalm service

# After networking because we need that
After=network.target

[Service]
Type=simple
User=root
Group=root

# Any setup we need to do, specifying the shell because otherwise who knows what's up
ExecStartPre=/bin/bash -c 'echo "hello world"'

# Set the working directory for the application
WorkingDirectory=/tmp

# Command to run the application
ExecStart=/usr/local/bin/cakepalm

# Restart policy, only on failure
Restart=on-failure

[Install]
# Start the service before we get to multi-user mode
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable cakepalm
systemctl restart cakepalm
systemctl is-active cakepalm
systemctl status cakepalm
