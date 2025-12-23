#!/bin/bash


install_rosetta_if_needed() {
    # 1. Apple Silicon (arm64) かどうかをチェック
    if [[ "$(uname -m)" != "arm64" ]]; then
        echo "This machine is not Apple Silicon (arm64). Rosetta installation is skipped."
        return 0
    fi

    # 2. 既にインストールされているかをファイルパスで確認
    # Rosetta 2 の実体が存在するパス
    local rosetta_path="/Library/Apple/usr/libexec/oah/libRosettaRuntime"

    if [ -f "$rosetta_path" ]; then
        echo "Rosetta 2 is already installed. Skipping."
    else
        echo "Rosetta 2 not found. Installing..."
        # --agree-to-license を付与しないと対話モードになりスクリプトが止まる可能性があります
        sudo softwareupdate --install-rosetta --agree-to-license

        if [ $? -eq 0 ]; then
            echo "Rosetta 2 installation completed successfully."
        else
            echo "Error: Failed to install Rosetta 2."
            exit 1
        fi
    fi
}

# https://brew.sh/
set -x
set +e
xcode-select --install
echo "Installing Homebrew..."
which /opt/homebrew/bin/brew >/dev/null 2>&1 ||
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
set -e

# need for `brew install google-japanese-ime`
echo 'run: sudo softwareupdate --install-rosetta'
install_rosetta_if_needed

# https://github.com/Homebrew/homebrew-bundle
# brew bundle is automatically installed when first run.
brew bundle --file "files/Brewfile"
brew doctor
brew update --verbose
set +x
