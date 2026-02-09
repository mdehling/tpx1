# ThinkPad X1 Carbon Gen 13 — Developer Setup

Automated post-install setup for ThinkPad X1 Carbon Gen 13 laptops running
Ubuntu 25.10.

## Usage

```bash
curl -fsSL https://raw.githubusercontent.com/mdehling/tpx1/main/bootstrap.sh | sudo bash
```

This will:

1. Install Ansible and Git LFS
2. Clone this repository and run the playbook
3. Add external apt repositories (Chrome, GitHub CLI, Node.js, VS Code)
4. Install all development packages
5. Install Webex and Horizon VDI Client
6. Apply audio fixes for Lunar Lake (newer kernel, SOF firmware, PipeWire
   buffer workaround)

## What's Installed

### Packages

- **Python**: python3, python3-venv, python3-pip, python-is-python3, python3-dev
- **Editors & tools**: neovim, tmux, git
- **Build tools**: cmake, ninja-build, ccache, build-essential
- **LLVM toolchain**: clang, lld, lldb
- **Utilities**: curl, gpg

### External Repositories

- Google Chrome
- GitHub CLI
- Node.js 22.x (with corepack enabled)
- VS Code

### Direct Downloads

- Webex
- Horizon VDI Client (with libxml2 compatibility workaround for 25.10)

### Audio Fixes

The ThinkPad X1 Carbon Gen 13 (Lunar Lake) requires a newer kernel and
firmware for working audio.  The playbook handles this by:

- Adding the Ubuntu Resolute (26.04) repository (pinned to prevent full
  upgrade)
- Installing the 6.19 kernel from that repository
- Installing custom-built SOF firmware
- Applying a PipeWire buffer underflow workaround

## Customization

Edit `group_vars/all.yml` to add or remove packages, repositories, and .deb
downloads.
