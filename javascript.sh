#!/usr/bin/env bash

set -e

mkdir ./tmp && cd ./tmp

echo "Installing Node Version Manager ..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh

source ./install.sh

echo "Removing Node Version Manager install script ..."
cd .. && rm -rf ./tmp

nvm install node
