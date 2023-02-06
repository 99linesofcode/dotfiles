export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# This is accidentally omitted on debian based operating systems
export PATH="$HOME/.local/bin:$PATH"

# -----------------------------------------------------------------------------
# Zsh
# -----------------------------------------------------------------------------

export ZSH=$HOME/.oh-my-zsh

plugins=(colorize
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

unsetopt beep

# -----------------------------------------------------------------------------
# Oh-My-Zsh plugins
# -----------------------------------------------------------------------------

zstyle :omz:plugins:ssh-agent lazy yes

# -----------------------------------------------------------------------------
# Programming Environments
# -----------------------------------------------------------------------------

# Enable these in a rootless docker environment such as your server
# export PATH=/config/bin:$PATH 
# export DOCKER_HOST=unix:///run/user/1000/docker.sock

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"

if command -v nodenv 1>/dev/null 2>&1; then
  eval "$(nodenv init -)"
fi

# -----------------------------------------------------------------------------
# Post Setup
# -----------------------------------------------------------------------------

source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------

alias vrc="vim ~/.config/nvim/init.lua"

# System defaults
alias ls="ls -GFh --color=auto"

# Git
alias gl="git sl"
alias gfix="git fix"

function gpb() {
  TARGET=${1-"main"}

  git checkout $TARGET \
  git fetch \
  git remote prune origin \
  git branch --merged $TARGET | grep -v '$TARGET$' | xargs git branch -d
}

