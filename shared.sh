#!/usr/bin/env bash

# thoughtbot
function fancy_echo {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

function ensure_homebrew {
  echo "Checking for homebrew ..."

  if test ! $(which brew); then
    echo "Installing homebrew ..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  if brew list | grep -Fq brew-cask; then
    echo "Uninstalling old Homebrew-Cask ..."
    brew uninstall --force brew-cask
  fi

  echo "Homebrew installed ..."

  echo "Updating homebrew ..."
  brew update > /dev/null
}