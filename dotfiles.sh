#!/usr/bin/env bash

set -e

if test ! $(which git); then
  echo "git is not installed; cannot clone dotfiles"
  exit 1
  # curl -L https://api.github.com/repos/lancejjohnson/dotfiles/tarball \
  #   | tar -xzv --exclude={README.markdown}
fi

# Clone dotfiles
echo "Cloning git repositories for initialization ..."
git clone https://github.com/lancejjohnson/dotfiles.git ~/.dotfiles

# Check for rcm
if test ! $(which rcup); then
  echo "rcm is not installed ..."
  brew tap thoughtbot/formulae
  brew install rcm
  brew cleanup
fi

# Symlink all files in ~/.dotfiles that are not preceded by .
rcup -f 2> $HOME/.setup/last_run_errors.txt
