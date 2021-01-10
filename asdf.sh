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
  fancy_echo "asdf already installed"
else
  fancy_echo "installing asdf"
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
fi

# Copied from thoughtbot mac script
alias install_asdf_plugin=add_or_update_asdf_plugin
add_or_update_asdf_plugin() {
  local name="$1"
  local url="$2"

  if ! asdf plugin-list | grep -Fq "$name"; then
    asdf plugin-add "$name" "$url"
  else
    asdf plugin-update "$name"
  fi
}

declare -a plugins=("ruby" "erlang" "elixir" "nodejs")

source "$HOME/.asdf/asdf.sh"
for plugin in "${plugins[@]}"; do
  fancy_echo "installing or updating asdf plugin ${plugin}"
  add_or_update_asdf_plugin "${plugin}"
done
