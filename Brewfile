tap "caskroom/cask"
tap "caskroom/fonts"
tap "caskroom/versions"
tap "homebrew/bundle"
tap "homebrew/core"
tap "homebrew/services"
tap "homebrew/versions"
tap "thoughtbot/formulae"
tap "universal-ctags/universal-ctags"

# System
brew "openssl"
# TODO: Add this as a command to add to bashrc or zshrc if it's not there
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew "coreutils"

brew "chromedriver", restart_service: true
brew "git"
brew "imagemagick"
brew "libyaml" # should come after openssl
brew "universal-ctags", args: ["HEAD"]
brew "rcm"
# Fixes tmux macOS issues
brew "reattach-to-user-namespace"
brew "the_silver_searcher"
brew "tmux"
brew "tree"
brew "watchman"
brew "zsh"

# Editors
brew "macvim", args: ["with-override-system-vim"]
brew "emacs", args: ["with-cocoa"]

# Python
brew "python"
brew "python3"

# Elixir
brew "erlang"

# Golang
brew "go"

# JavaScript
brew "node"
brew "phantomjs"
brew "yarn"


# Fonts

# Other
brew "exercism"
brew "heroku"
brew "openshift-cli"

# brew "gmp@4"
# brew "cloog", link: false
# brew "cscope"
# brew "mpfr@2"
# brew "libmpc@0.8"
# brew "gcc@4.9"
# brew "libffi"
# brew "gnupg"
# brew "isl@0.11"
# brew "jq"
# brew "libevent"
# brew "readline", link: true
# brew "pkg-config"
# brew "qt"
# brew "unixodbc"
# brew "xhyve", args: ["HEAD"]
