[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

url=https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
curl -o /tmp/amazon-cloudwatch-agent.deb $url
dpkg --install --skip-same-version /tmp/amazon-cloudwatch-agent.deb
rm -f /tmp/amazon-cloudwatch-agent.deb
