#!/usr/bin/env bash

set -e

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if test ! $(which node); do
  mkdir ./tmp && cd ./tmp

  echo "Installing Node Version Manager ..."
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh

  source ./install.sh

  echo "Removing Node Version Manager install script ..."
  cd .. && rm -rf ./tmp

  nvm install node
else
  echo "Node is installed"
done

