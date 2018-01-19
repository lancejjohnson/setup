#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

# This is syncing everything from the directory in which you pulled or copied
# dev-setup from the repo into your home directory.
# This is how he is getting all his dotfiles in place.
function doIt() {
    # Sync everything from this repo to the home directory
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "README.md" --exclude "LICENSE" -avh --no-perms . ~;
    # Source the bash_profile so the shell is ready
    source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
