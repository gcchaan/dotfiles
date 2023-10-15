#!/bin/bash

# https://brew.sh/
set -x
set +e
xcode-select --install
echo "Installing Homebrew..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 ||
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
set -e

# https://github.com/Homebrew/homebrew-bundle
# brew bundle is automatically installed when first run.
brew bundle --file "files/Brewfile"
brew doctor
brew update --verbose
set +x
