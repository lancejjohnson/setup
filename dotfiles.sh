#!/usr/bin/env bash

set -e

# Ask for the administrator password upfront.
sudo -v

source ./shared.sh

banner_echo "dotfiles"

if test ! $(which git); then
  fancy_echo "git is not installed; cannot clone dotfiles"
  exit 1
fi

# Clone dotfiles
fancy_echo "Cloning git repositories for initialization ..."
git clone https://github.com/lancejjohnson/dotfiles.git $HOME/.dotfiles

# Check for rcm
if test ! $(which rcup); then
  fancy_echo "installing rcm"
  ensure_homebrew
  cp -f $HOME/.dotfiles/rcrc $HOME/.rcrc
  brew tap thoughtbot/formulae
  brew install rcm
  brew cleanup
fi

# Symlink all files in ~/.dotfiles that are not preceded by .
rcup -f -d $HOME/.dotfiles 2> $HOME/.setup/last_run_errors.txt
