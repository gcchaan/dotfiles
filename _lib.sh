function setup_homebrew() {
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
}

# TODO:
function setupNodeJs() {
    volta install yarn@3
}

# TODO:
# https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html
function installOrUpgradeAwsCliMac() {
    curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
    sudo installer -pkg AWSCLIV2.pkg -target /
}