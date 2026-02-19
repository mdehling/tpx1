#!/bin/bash
set -euo pipefail

REPO_URL="https://github.com/mdehling/tpx1.git"
PLAYBOOK="postinstall.yml"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check for root/sudo access
if [[ $EUID -ne 0 ]]; then
    log_error "This script must be run as root or with sudo"
    exit 1
fi

log_info "Starting ThinkPad X1 developer setup..."

# Update apt cache
log_info "Updating apt cache..."
apt-get update -qq

# Install ansible and git-lfs if not present
log_info "Installing dependencies..."
apt-get install -y -qq ansible git-lfs

# Run ansible-pull
log_info "Running Ansible playbook from ${REPO_URL}..."
ANSIBLE_HOST_PATTERN_MISMATCH=ignore \
    ansible-pull -U "${REPO_URL}" -i inventory.yml "${PLAYBOOK}"

log_info "Setup complete!"
