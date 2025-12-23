#!/bin/bash

set -eu

source ./_lib.sh
dotfiles_directory="$(cd "$(dirname "$0")"; pwd -P)"

xdg_config_home="$HOME/.config"
mkdir -p $xdg_config_home/{git,ghostty,lazygit,nvim,sheldon,tmux,zsh}

# "source,dest"
declare -a mappings=(
    "files/nvim/init.lua,${xdg_config_home}/nvim/init.lua"
    "files/lazygit/config.yml,${xdg_config_home}/lazygit/config.yml"
    "files/zsh/.zshenv,${HOME}/.zshenv"
    "files/zsh/.zshrc,${xdg_config_home}/zsh/.zshrc"
    "files/zsh/abbreviations,${xdg_config_home}/zsh/abbreviations"
    "files/zsh/lazy,${xdg_config_home}/zsh/lazy"
    "files/zsh/plugins.toml,${xdg_config_home}/sheldon/plugins.toml"
    "files/.gitconfig,${xdg_config_home}/git/config"
    "files/.gitignore_global,${xdg_config_home}/git/ignore"
    "files/tmux.conf,${xdg_config_home}/tmux/tmux.conf"
    "files/.ideavimrc,${HOME}/.ideavimrc"
    "files/ghostty/config,${xdg_config_home}/ghostty/config"
)

for mapping in "${mappings[@]}"
do
    IFS=","
    set -- $mapping
    source=$1
    dest=$2
    if [ -L $dest ] ;then
        echo "ok: ${dest}"
        ln -sf  "${dotfiles_directory}/${source}" $dest
    elif [ -f $dest ] ;then
        echo "skip: ${dest}"
    else
        echo "create: ${dest}"
        ln -s  "${dotfiles_directory}/${source}" $dest
    fi
done
IFS=

# dir
if [ -L ${xdg_config_home}/nvim/lua ] ;then
    echo "ok: nvim/lua"
else
    echo "create: nvim/lua"
    ln -s  "${dotfiles_directory}/files/nvim/lua" ${xdg_config_home}/nvim
fi
