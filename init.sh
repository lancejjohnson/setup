#!/usr/bin/env bash


if test $(which git); then
  mkdir ~/.dotfiles ~/.setup

  echo "Cloning git repositories for initialization"
  git clone git@github.com:lancejjohnson/dotfiles.git ~/.dotfiles
  git clone git@github.com:lancejjohnson/setup.git ~/.setup
else
  echo "git is not installed"
  echo "initializing from tarballs"
  # mkdir ~/tmp
  # cd ~/tmp
  # curl -L https://api.github.com/repos/lancejjohnson/setup/tarball > ./setup.tar.gz
  # curl -L https://api.github.com/repos/lancejjohnson/dotfiles/tarball > ./dotfiles.tar.gz

  # | tar -xzv --strip-components 1 --exclude={README.md,LICENSE}
fi

