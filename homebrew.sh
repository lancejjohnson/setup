#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

source ./shared.sh

ensure_homebrew

declare -a brewfiles=("Brewfile" "Caskfile" "Fontfile")

for f in "${brewfiles[@]}"; do
  brewfile="$HOME/.dotfiles/${f}"
  if [ -e $brewfile ]; then
    fancy_echo "Bundling $brewfile ..."
    brew bundle --file=$brewfile
  else
    fancy_echo "${brewfile} does not exist"
  fi
done

if test $(which heroku); then
  brew unlink heroku
  brew link --force heroku
fi

brew cleanup
