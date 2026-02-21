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

function setupZsh() {
    require_cmd git
    local prezto_dir="${ZDOTDIR:-$HOME}/.zprezto"

    if [ -d "$prezto_dir/.git" ]; then
        log_info "skip: prezto already exists at $prezto_dir"
    else
        log_info "install: prezto"
        git clone --recursive https://github.com/sorin-ionescu/prezto.git "$prezto_dir"
    fi

    mkdir -p "$HOME/.z_lib"
    if [ -d "$HOME/.z_lib/z/.git" ]; then
        log_info "skip: z already exists at $HOME/.z_lib/z"
    else
        log_info "install: z"
        git clone https://github.com/rupa/z.git "$HOME/.z_lib/z"
    fi
}


function setupTmux() {
    require_cmd git
    local tpm_dir="$HOME/.tmux/plugins/tpm"
    if [ -d "$tpm_dir/.git" ]; then
        log_info "skip: tmux tpm already exists at $tpm_dir"
    else
        log_info "install: tmux tpm"
        mkdir -p "$(dirname "$tpm_dir")"
        git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
    fi
}

setupZsh
setupTmux
