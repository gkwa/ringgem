#!/usr/bin/env bash
set -e

HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
HOMEBREW_SHELLENV_COMMAND='eval "$('${HOMEBREW_PREFIX}'/bin/brew shellenv)"'

install_packages() {
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
       exit 1
   fi
}

setup_linuxbrew_user() {
   if ! id -u linuxbrew &>/dev/null; then
       sudo useradd --create-home linuxbrew --shell /bin/bash
   fi
   if ! test -f /etc/sudoers.d/linuxbrew; then
       echo "linuxbrew ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/linuxbrew
   fi
}

add_homebrew_shellenv() {
   local file="$1"
   if ! grep -q "Setup Homebrew if it exists" "$file"; then
       echo "
# Setup Homebrew if it exists
if [ -d \"$HOMEBREW_PREFIX\" ]; then
   export PATH=\"/usr/local/bin:\$PATH\"
   $HOMEBREW_SHELLENV_COMMAND
else
   echo \"Homebrew is not installed in the expected location.\" >&2
fi" >> "$file"
       echo "Updated $file with Homebrew shellenv"
   else
       echo "Homebrew shellenv already exists in $file, skipping."
   fi
}

install_homebrew() {
   local script=$(mktemp /tmp/homebrew-XXXXX.sh)
   chmod a+rx $script
   cat >$script <<EOF
timeout 30s curl --retry 9999 --connect-timeout 1 -sSf https://www.google.com >/dev/null
export PATH=${HOMEBREW_PREFIX}/bin:\$PATH
NONINTERACTIVE=1 /bin/bash -c "\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$HOMEBREW_SHELLENV_COMMAND
if ! grep HOMEBREW_AUTO_UPDATE_SECS ~/.profile; then
 echo 'export HOMEBREW_AUTO_UPDATE_SECS=\$((24*60*60))' >> ~/.profile
fi
brew --version
EOF
   cd /home/linuxbrew
   if [ ! -f "${HOMEBREW_PREFIX}/bin/brew" ]; then
       sudo --login --user linuxbrew bash -e $script
   else
       echo "Homebrew is already installed. Skipping installation."
   fi
   rm -f $script
}

install_brew_wrapper() {
   cat > /usr/local/bin/brew <<EOF
#!/bin/bash
sudo --user linuxbrew --login brew "\$@"
EOF

   chmod +x /usr/local/bin/brew
   echo "Installed brew wrapper script to /usr/local/bin/brew"
}

install_packages
setup_linuxbrew_user
install_homebrew

if [ -f "${HOMEBREW_PREFIX}/bin/brew" ]; then
   export PATH="/usr/local/bin:$PATH"
   eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
else
   echo "Homebrew installation seems to have failed. Please check the logs."
   exit 1
fi

add_homebrew_shellenv ~/.bashrc
add_homebrew_shellenv ~/.profile
add_homebrew_shellenv "/etc/skel/.profile"
add_homebrew_shellenv "/etc/skel/.bashrc"
add_homebrew_shellenv "/root/.profile"
add_homebrew_shellenv "/root/.bashrc"
add_homebrew_shellenv "/home/linuxbrew/.bashrc"
add_homebrew_shellenv "/home/linuxbrew/.profile"

install_brew_wrapper

echo "Homebrew installation, skel file updates, root initialization file updates, and brew wrapper script installation completed successfully."
