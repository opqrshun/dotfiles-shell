#!/usr/bin/env bash

function setupZsh() {
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

    # install pure prompt
    yarn global add pure-prompt

    mkdir -p "$HOME/.z_lib"
    git clone  https://github.com/rupa/z.git "$HOME/.z_lib/z"
}


function setupTmux() {
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

setupZsh
setupTmux
