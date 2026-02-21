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

if [[ -f "${HOME}/.z_lib/z/z.sh" ]]; then
  source "${HOME}/.z_lib/z/z.sh"
fi
if command -v thefuck >/dev/null 2>&1; then
  eval "$(thefuck --alias)"
fi


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
if command -v eza >/dev/null 2>&1; then
  alias ls='eza'
  alias ll='ls -ghl --git'
  alias l='ll'
  alias la='ls -ga'
  alias lla='ls -aghl --git'
  alias lt='ls --tree'
else
  alias ll='ls -lah'
  alias l='ll'
  alias la='ls -A'
  alias lla='ls -lahA'
  alias lt='ls'
fi
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
alias git-rpush="git push --set-upstream origin"
alias gbranch="git branch --sort authordate"

if command -v lazygit >/dev/null 2>&1; then
  alias lzg="lazygit"
fi
if command -v lazydocker >/dev/null 2>&1; then
  alias lzd="lazydocker"
fi
alias re="fuck"
# Show OS info when opening a new terminal
if command -v neofetch >/dev/null 2>&1; then
  neofetch
elif command -v fastfetch >/dev/null 2>&1; then
  fastfetch
fi

if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/broot/launcher/bash/br" ]; then
  source "${XDG_CONFIG_HOME:-$HOME/.config}/broot/launcher/bash/br"
fi
