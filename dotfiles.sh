#!/usr/bin/env bash

# Download and sync files from dotfiles
if test $(which git); then
  mkdir ~/.dotfiles

  echo "Cloning git repositories for initialization"
  git clone git@github.com:lancejjohnson/dotfiles.git ~/.dotfiles
else
  echo "git is not installed; getting dotfiles via curl"
  mkdir ~/.tmp && cd ~/.tmp

  curl -L https://api.github.com/repos/lancejjohnson/dotfiles/tarball \
    | tar -xzv --exclude={README.markdown}
fi
