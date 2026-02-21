#!/usr/bin/env bash

log_info() {
    printf '[INFO] %s\n' "$*"
}

require_cmd() {
    command -v "$1" >/dev/null 2>&1 || {
        printf '[ERROR] Required command not found: %s\n' "$1" >&2
        exit 1
    }
}

function installSpaceVim() {
    if [ -d "$HOME/.SpaceVim" ] || [ -d "$HOME/.SpaceVim.d" ]; then
        log_info "skip: SpaceVim appears already installed"
        return 0
    fi

    require_cmd curl
    require_cmd bash
    log_info "install: SpaceVim"
    curl -sLf https://spacevim.org/install.sh | bash
}
installSpaceVim
