#!/usr/bin/env bash

cd $HOME/dotfiles

if which zsh > /dev/null 2>&1; then
  sudo chsh -s $(which zsh)
else
  echo "Zsh has not been installed yet."
fi

mkdir -p \
  $HOME/.config \
  $HOME/.local/bin \
  $HOME/.local/share \
  $HOME/.local/state

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" > /dev/null 2>&1
  rm $HOME/.zshrc
fi

ln -sf $PWD/.asdfrc $HOME/.asdfrc
ln -sf $PWD/.config/nvim $HOME/.config/nvim
ln -sf $PWD/.gitconfig $HOME/.gitconfig
ln -sf $PWD/.gitignore_global $HOME/.gitignore_global
ln -sf $PWD/.ssh $HOME/.ssh
ln -sf $PWD/.zshrc $HOME/.zshrc

if [ ! -d "$HOME/.asdf" ]; then
  git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf
fi
