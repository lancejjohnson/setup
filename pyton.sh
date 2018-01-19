#!/usr/bin/env bash
source ./shared.sh

ensure_homebrew

brew bundle --file=Brewfile-python
brew cleanup
