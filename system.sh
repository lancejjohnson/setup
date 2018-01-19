#!/usr/bin/env bash
source ./shared.sh

# TODO: This is the file I need to modify the most

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

ensure_homebrew

brew update
# Upgrade any already-installed formulae.
# brew upgrade --all
brew bundle --file-Brewfile-system
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash


# # Install ruby-build and rbenv
# brew install ruby-build
# brew install rbenv
# LINE='eval "$(rbenv init -)"'
# grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# # Install more recent versions of some OS X tools.
# brew install vim --override-system-vi
# brew install homebrew/dupes/grep
# brew install homebrew/dupes/openssh
# brew install homebrew/dupes/screen
# brew install homebrew/php/php55 --with-gmp

# Install other useful binaries.
brew install ack
brew install dark-mode
#brew install exiv2
brew install git
brew install git-lfs
# brew install git-extras
# brew install hub
brew install imagemagick --with-webp
# brew install lynx
# brew install p7zip
# brew install pigz
brew install pv
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install webkit2png
# brew install zopfli
brew install pkg-config libffi
brew install pandoc

# Lxml and Libxslt
brew install libxml2
brew install libxslt
brew link libxml2 --force
brew link libxslt --force

# TODO: Move to another file
# # Install Heroku
# brew install heroku-toolbelt
# heroku update

#Remove comment to install LaTeX distribution MacTeX
#brew cask install --appdir="/Applications" mactex

# Install Docker, which requires virtualbox
brew install docker
# brew install boot2docker

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

# Remove outdated versions from the cellar.
brew cleanup
