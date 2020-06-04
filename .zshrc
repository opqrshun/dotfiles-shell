# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -U promptinit; promptinit
zstyle :prompt:pure:git:stash show yes
prompt pure

if [ -n "${commands[fzf-share]}" ]; then
	source "$(fzf-share)/key-bindings.zsh"
	source "$(fzf-share)/completion.zsh"
fi

if [[ "$OSTYPE" == darwin* ]]; then
  # $(brew --prefix)/opt/fzf/install
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

source "${HOME}/.z_lib/z/z.sh"


if [[ -s "${ZDOTDIR:-$HOME}/.zcustom" ]]; then
  source "${ZDOTDIR:-$HOME}/.zcustom"
fi

if [[ -s "${ZDOTDIR:-$HOME}/.zspecial" ]]; then
  source "${ZDOTDIR:-$HOME}/.zspecial"
fi

if [[ -n ${TMUX} && -n ${commands[tmux]} ]];then
  TERM=screen-256color
fi
# Aliases
alias ...='cd ../..'
alias sortmirror='sudo reflector --latest 200 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias ls='exa'
alias ll='ls -ghl --git'
alias l='ll'
alias la='ls -ga'
alias lla='ls -aghl --git'
alias lt='ls --tree'
alias ip='ip -c'
alias rm='rm -i'
alias f='ranger'
alias c='cmus'
alias h='htop'
alias vim='nvim'
alias v='nvim'
alias cat='bat'
alias relogin='exec $SHELL -l'

# git
alias gpr="hub pull-request -p"
alias g.="git checkout ."
alias gpush="git push --set-upstream origin"
alias gbranch="git branch --sort authordate"

alias lzg="lazygit"
alias lzd="lazydocker"
# Show OS info when opening a new terminal
neofetch

