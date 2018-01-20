#!/usr/bin/env bash

set -e

if test ! $(which git); then
  echo "git is not installed; cannot clone repositories; exiting!"
  exit 1
else
  echo "Cloning git repositories for initialization ..."
  # git clone git@github.com:lancejjohnson/dotfiles.git ~/.dotfiles
  git clone https://github.com/lancejjohnson/setup.git ~/.setup
  cd $HOME/.setup
  source ./setup.sh
fi

