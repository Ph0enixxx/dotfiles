#!/usr/bin/env bash

source ./utils.sh

mklink $PWD/utils.sh ~/.utils.sh

# create folder
mkdir -p ~/.config

# Zsh
echo "Initialize Zsh config ..."
source ./zsh/init.sh

# Tmux
# info zsh "Initialize Tmux config ..."
# source ./tmux/init.sh

# SpaceVim
source ./SpaceVim/init.sh

# Git
echo "Initialize Git config ..."
mklink $PWD/git/gitconfig ~/.gitconfig
mklink $PWD/git/gitignore ~/.gitignore

# Bat
echo "Initialize Bat config ..."
mklink $PWD/config/bat $(bat --config-dir)

# Neofetch
echo "Initialize Neofetch config ..."
mklink $PWD/config/neofetch ~/.config/neofetch

# Maven
echo "Initialize Maven config ..."
mkdir -p ~/.m2
mklink $PWD/config/maven-settings.xml ~/.m2/settings.xml

echo "Initialize eslint/taskwarrior/ripgrep/archey/wego/range/bottom/cheat config ..."

# eslint
mklink $PWD/config/eslintrc.json ~/.eslintrc.json

# taskwarrior
mklink $PWD/config/taskrc ~/.taskrc

# ripgrep
mklink $PWD/config/ripgreprc ~/.ripgreprc

# archey
if [[ $System == 'Darwin' ]]; then
  mklink $PWD/config/archey.json ~/.config/archey4/config.json
elif [[ $Distribution == 'Debian' ]]; then
  sudo ln -sf $PWD/config/archey.json /etc/archey4/config.json
fi

# wego
mklink $PWD/config/wego ~/.wegorc

# ranger
mkdir -p ~/.config/ranger
mklink $PWD/config/ranger.conf ~/.config/ranger/rc.conf

# bottom
mkdir -p ~/.config/bottom
mklink $PWD/config/bottom.toml ~/.config/bottom/bottom.toml

# cheat
mkdir -p ~/.config/cheat
mklink $PWD/cheat/conf.yml ~/.config/cheat/conf.yml
mklink $PWD/cheat/personal ~/.config/cheat/cheatsheets/personal

# npm
if [[ $System == "Darwin" ]] {
  local pnpm_home="$HOME/Library/pnpm"
} elif [[ $System == "Linux" ]] {
  local pnpm_home="$HOME/.local/share/pnpm"
}
echo "; registry=https://registry.npmmirror.com" >> ~/.npmrc
echo "coc.nvim:registry=https://registry.npmmirror.com/" >> ~/.npmrc
echo "global-bin-dir=${pnpm_home}" >> ~/.npmrc
echo "store-dir=${pnpm_home}/store" >> ~/.npmrc

