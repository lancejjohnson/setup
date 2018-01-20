#!/usr/bin/env bash
source ./shared.sh

ensure_homebrew

brew bundle --file=Brewfile-ruby

# thoughtbot
if brew list | grep --silent "qt@5.5"; then
  fancy_echo "Symlink qmake binary to /usr/local/bin for Capybara Webkit..."
  brew unlink qt@5.5
  brew link --force qt@5.5
fi

brew unlink heroku
brew link --force heroku

brew cleanup
