export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# This is accidentally omitted on debian based operating systems
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
  docker-compose
  git
  history
  laravel
  rails
  ssh-agent
)
ZSH_THEME=juanghurtado
COMPLETION_WAITING_DOTS="true"


zstyle :omz:plugins:ssh-agent identities blade_github_rsa blade_digitalocean_rsa blade_gitlab_ed25519

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

function gpb() {
  local TARGET=${1-"main"}

  git checkout $TARGET
  git fetch
  git remote prune origin
  git branch --merged $TARGET | grep -v $TARGET | xargs --no-run-if-empty git branch -d
}
