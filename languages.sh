#!/usr/bin/env bash

set -e

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

source ./shared.sh

banner_echo "asdf"

if [ -d $HOME/.asdf ]
then
  echo "asdf already installed"
else
  echo "installing asdf"
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
fi
