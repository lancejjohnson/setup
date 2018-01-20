#!/usr/bin/env bash
source ./shared.sh

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

ensure_homebrew

# thoughtbot
if brew list | grep --silent "qt@5.5"; then
  fancy_echo "Symlink qmake binary to /usr/local/bin for Capybara Webkit..."
  brew unlink qt@5.5
  brew link --force qt@5.5
fi

if test ! $(which ruby-install); then
  echo "Installing ruby-install"
  brew install ruby-install
fi

declare -a versions=("2.4" "2.5")

for version in "${versions[0]}"; do
  echo "Installing Ruby version ${version} ..."
  ruby-install ruby ${version}
done

# gem_install_or_update "bundler"
# number_of_cores=$(sysctl -n hw.ncpu)
# bundle config --global jobs $((number_of_cores - 1))

