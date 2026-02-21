#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES="${DOTFILES:-$SCRIPT_DIR}"
export DOTFILES

source "$SCRIPT_DIR/install/link.sh"
source "$SCRIPT_DIR/install/setupShell.sh"
source "$SCRIPT_DIR/install/setupVim.sh"

