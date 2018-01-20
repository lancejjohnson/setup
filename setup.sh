#!/usr/bin/env bash
source ./functions.sh

# Initialize
source ./init.sh

# Acquire dotfiles and put in place
source ./dotfiles.sh # TODO

# Prep the OS
source ./prepareos.sh

# Customize the OS
source ./configos.sh

# Install the package manager
source ./homebrew.sh

# Install packages
# brew bundle --file=Brewfile
# brew bundle --file=Caskfile
# brew bundle --file=Fontfile

# Configure languages
declare -a languages=("ruby" "golang" "python" "elixir" "javascript")

for lang in "${languages[@]}"; do
  echo "${lang}.sh"
  # source "${lang}.sh"
done
