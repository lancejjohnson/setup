#!/usr/bin/env bash

set -e

# Ask for the administrator password upfront.
sudo -v

if test ! $(which git); then
  echo "git is not installed; cannot clone repositories; exiting!"
  exit 1
else
  echo "Installing setup scripts ..."
  curl -L https://api.github.com/repos/lancejjohnson/setup/tarball | tar xz --strip=1 -C $HOME/.setup
  # git clone https://github.com/lancejjohnson/setup.git $HOME/.setup
  cd $HOME/.setup
  source ./setup.sh
fi

