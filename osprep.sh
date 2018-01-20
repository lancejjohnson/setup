#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osxprep.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "------------------------------"
echo "Updating macOS.  If this requires a restart, run the script again."
sudo softwareupdate --install --recommended

echo "------------------------------"
echo "Installing Xcode Command Line Tools."
xcode-select --install
