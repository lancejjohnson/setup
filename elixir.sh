#!/usr/bin/env bash

set -e

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

source ./shared.sh

if test ! $(which git); then
  echo "git is not installed; cannot setup elixir"
  exit 1
fi

echo "Installing exenv ..."
git clone git://github.com/mururu/exenv.git ~/.exenv

echo "Installing elixir-build ..."
git clone git://github.com/mururu/elixir-build.git ~/.exenv/plugins/elixir-build

exec $SHELL

if test ! $(which exenv); then
  echo "Problem installing exenv, exiting!"
  exit 1
fi
echo "Installing Elixir ..."
exenv install 1.6.0
exenv global 1.6.0
