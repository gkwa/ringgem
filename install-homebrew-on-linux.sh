#!/usr/bin/env bash
set -e

if command -v apt-get &>/dev/null || command -v apt &>/dev/null; then
    apt-get update
    sudo apt-get install --assume-yes build-essential procps curl file git
elif [ -f /etc/fedora-release ] || [ -f /etc/centos-release ] || [ -f /etc/redhat-release ]; then
    sudo yum -y groupinstall 'Development Tools'
    sudo yum -y install procps-ng curl file git
elif [ -f /etc/arch-release ]; then
    sudo pacman -S base-devel procps-ng curl file git
else
    echo "Unsupported distribution"
    #exit 1
fi

# https://docs.brew.sh/Homebrew-on-Linux
if ! id -u linuxbrew &>/dev/null; then
    sudo useradd --create-home linuxbrew --shell /bin/bash
fi

if ! test -f /etc/sudoers.d/linuxbrew; then
    echo "linuxbrew ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/linuxbrew
fi

script=$(mktemp /tmp/homebrew-XXXXX.sh)
chmod a+rx $script
cat >$script <<'EOF'
# Wait for dns
timeout 30s curl --retry 9999 --connect-timeout 1 -sSf https://www.google.com >/dev/null
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH # suppress warning
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
source ~/.bashrc
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/linuxbrew/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
if ! grep HOMEBREW_AUTO_UPDATE_SECS ~/.profile; then
  cat >> ~/.profile <<EOF1
export HOMEBREW_AUTO_UPDATE_SECS=$((24*60*60)) # 1 day
EOF1
fi
brew --version
EOF

cd /home/linuxbrew
if sudo -u linuxbrew brew --version >/dev/null; then
    # its already there
    exit 0
fi

sudo --login --user linuxbrew bash -e $script
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.bashrc
rm -f $script

# Function to update initialization files
update_init_file() {
    local file="$1"
    local backup="${file}.bak"
    # Backup the original file
    cp "$file" "$backup"
    # Append Homebrew setup to the file
    echo '
# Setup Homebrew if it exists
if [ -d "/home/linuxbrew/.linuxbrew" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
    echo "Homebrew is not installed in the expected location." >&2
fi
' | tee -a "$file" > /dev/null
    echo "Updated $file"
}

# Update /etc/skel/.profile and /etc/skel/.bashrc
update_skel_file() {
    local file="$1"
    update_init_file "$file"
}

# Update /etc/skel/.profile
update_skel_file "/etc/skel/.profile"

# Update /etc/skel/.bashrc
update_skel_file "/etc/skel/.bashrc"

# Update root's initialization files
update_init_file "/root/.profile"
update_init_file "/root/.bashrc"

echo "Homebrew installation, skel file updates, and root initialization file updates completed successfully."
