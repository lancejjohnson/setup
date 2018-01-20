#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

source ./functions.sh

ensure_homebrew

declare -a brewfiles=("Brewfile" "Caskfile" "Fontfile")

for f in "${brewfiles[@]}"; do
  brewfile="$HOME/.${f}"
  if [ -e $brewfile ]; then
    echo "Bundling $brewfile ..."
    brew bundle --file=$brewfile
  else
    echo "${brewfile} does not exist"
  fi
done
