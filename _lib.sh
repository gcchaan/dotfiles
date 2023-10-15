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
