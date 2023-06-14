export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# This directory is accidentally omitted on debian based operating systems
export PATH="$HOME/.local/bin:$PATH"

# -----------------------------------------------------------------------------
# (Oh-My-)Zsh
# -----------------------------------------------------------------------------

unsetopt beep

export ZSH=$HOME/.oh-my-zsh

plugins=(
  asdf
  colorize
  colored-man-pages
  composer
  docker
  docker-compose
  git
  history
  laravel
  rails
  ssh-agent
)
ZSH_THEME=juanghurtado
COMPLETION_WAITING_DOTS="true"


zstyle :omz:plugins:ssh-agent identities blade_github_ed25519 blade_gitlab_ed25519 blade_hetzner_ed25519

# -----------------------------------------------------------------------------
# Post Setup
# -----------------------------------------------------------------------------

source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------

alias vrc="vim $HOME/dotfiles/.config/nvim/init.lua"
alias zrc="vim $HOME/dotfiles/.zshrc"

# System defaults
alias ls="ls -GFh --color=auto"

# Git
alias gl="git sl"
alias gfix="git fix"

# function to automatically prune branches both locally and remote
function gpb() {
  local TARGET=${1-"main"}

  git checkout $TARGET
  git fetch
  git remote prune origin
  git branch --merged $TARGET | grep -v $TARGET | xargs --no-run-if-empty git branch -d
}

# laravel
alias a="artisan"
alias tinker="artisan tinker"

# mrsk
alias mrsk="docker run -it --rm -v $PWD:/workdir -v $HOME/.gitconfig:/root/.gitconfig -v $SSH_AUTH_SOCK:/ssh-agent -v /var/run/docker.sock:/var/run/docker.sock -e SSH_AUTH_SOCK=/ssh-agent ghcr.io/99linesofcode/mrsk:latest"

# -----------------------------------------------------------------------------
# Binds
# -----------------------------------------------------------------------------

bindkey -e
# Control + backspace
bindkey '^H' backward-kill-word
# Control + arrows
bindkey ";5C" forward-word
bindkey ";5D" backward-word
