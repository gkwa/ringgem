#!/usr/bin/env bash

# Source homebrew if available
[ -s /etc/profile.d/homebrew.sh ] && source /etc/profile.d/homebrew.sh

# Set non-interactive mode for apt
export DEBIAN_FRONTEND=noninteractive

# Function to detect OS and version
detect_os() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$ID
        VERSION_CODENAME=${VERSION_CODENAME:-}
        
        # Extract codename from VERSION if VERSION_CODENAME is empty
        if [ -z "$VERSION_CODENAME" ] && [ -n "$VERSION" ]; then
            VERSION_CODENAME=$(echo "$VERSION" | grep -oE '\([^)]+\)' | tr -d '()' | tr '[:upper:]' '[:lower:]')
        fi
        
        echo "Detected OS: $OS, Codename: $VERSION_CODENAME"
    else
        echo "Error: Cannot detect OS version"
        exit 1
    fi
}

# Function to determine if LTS version should be used
use_lts() {
    # Check if LTS is explicitly requested via environment variable
    if [ "$FLUENT_PACKAGE_LTS" = "true" ]; then
        return 0
    fi
    
    # Check if VERSION contains LTS
    if echo "$VERSION" | grep -q "LTS"; then
        return 0
    fi
    
    # Default to non-LTS
    return 1
}

# Function to build installation URL
build_url() {
    local os="$1"
    local codename="$2"
    local lts_suffix=""
    
    if use_lts; then
        lts_suffix="-lts"
    fi
    
    case "$os" in
        ubuntu)
            case "$codename" in
                noble|jammy|focal)
                    echo "https://toolbelt.treasuredata.com/sh/install-ubuntu-${codename}-fluent-package5${lts_suffix}.sh"
                    ;;
                *)
                    echo "Error: Unsupported Ubuntu version: $codename"
                    echo "Supported versions: noble, jammy, focal"
                    exit 1
                    ;;
            esac
            ;;
        debian)
            case "$codename" in
                bookworm|bullseye)
                    echo "https://toolbelt.treasuredata.com/sh/install-debian-${codename}-fluent-package5${lts_suffix}.sh"
                    ;;
                *)
                    echo "Error: Unsupported Debian version: $codename"
                    echo "Supported versions: bookworm, bullseye"
                    exit 1
                    ;;
            esac
            ;;
        *)
            echo "Error: Unsupported OS: $os"
            echo "Supported OS: ubuntu, debian"
            exit 1
            ;;
    esac
}

# Main execution
main() {
    echo "Fluentd Package Installation Script"
    echo "=================================="
    
    # Detect OS
    detect_os
    
    # Build installation URL
    url=$(build_url "$OS" "$VERSION_CODENAME")
    
    if [ $? -ne 0 ]; then
        echo "$url"  # This will be the error message
        exit 1
    fi
    
    # Show what we're about to do
    echo "Installation URL: $url"
    echo "LTS version: $(use_lts && echo "yes" || echo "no")"
    
    # Confirm before proceeding (optional - remove if you want silent installation)
    read -p "Proceed with installation? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Installation cancelled"
        exit 0
    fi
    
    # Execute installation
    echo "Downloading and executing installation script..."
    if curl -fsSL "$url" | sh; then
        echo "Installation completed successfully!"
        echo "You can now start fluentd with: sudo systemctl start fluentd.service"
    else
        echo "Installation failed!"
        exit 1
    fi
}

# Show help if requested
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    cat << EOF
Fluentd Package Installation Script

Usage: $0 [options]

Options:
  -h, --help    Show this help message
  
Environment Variables:
  FLUENT_PACKAGE_LTS=true    Force LTS version installation
  
Supported Systems:
  - Ubuntu: Noble (24.04), Jammy (22.04), Focal (20.04)
  - Debian: Bookworm (12), Bullseye (11)

Examples:
  $0                           # Install regular version
  FLUENT_PACKAGE_LTS=true $0   # Install LTS version
EOF
    exit 0
fi

# Run main function
main
