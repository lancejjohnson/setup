#!/usr/bin/env bash

set -e

# Ask for the administrator password upfront.
sudo -v

if test ! $(which git); then
  echo "git is not installed; cannot clone repositories; exiting!"
  exit 1
else
  echo "Cloning git repositories for initialization ..."
  git clone https://github.com/lancejjohnson/setup.git $HOME/.setup
  cd $HOME/.setup
  source ./setup.sh
fi

