#!/usr/bin/env bash
source ./shared.sh

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
# chsh -s /usr/local/bin/bash

# thoughtbot
shell_path="$(which zsh)"
echo "Changing your shell to zsh ..."
if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
  echo "Adding '$shell_path' to /etc/shells"
  sudo sh -c "echo $shell_path >> /etc/shells"
fi
sudo chsh -s "$shell_path" "$USER"

source $HOME/.zshrc
