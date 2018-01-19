#!/usr/bin/env bash
source ./shared.sh

# Prep the OS
. ./osxprep.sh

# Customize the OS
. ./macos.sh

# Install the package manager
. ./homebrew.sh

# Install packages
brew bundle Brewfile
brew bundle Caskfile
