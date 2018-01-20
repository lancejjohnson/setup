#!/usr/bin/env bash

set -e

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

source ./prepareos.sh

source ./configos.sh

source ./dotfiles.sh

source ./homebrew.sh

source ./system.sh

declare -a languages=("ruby" "elixir" "javascript")

for lang in "${languages[@]}"; do
  echo "Preparing ${lang}.sh ..."
  source "${lang}.sh"
done
