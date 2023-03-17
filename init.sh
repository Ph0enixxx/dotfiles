#!/usr/bin/env bash

source ./utils.sh
source ./zsh/custom/config/functions.zsh

mklink $PWD/utils.sh ~/.utils.sh

# create folder
mkdir -p ~/.config

# Zsh
info zsh "Initialize Zsh config ..."
source ./zsh/init.sh

# Tmux
# info zsh "Initialize Tmux config ..."
# source ./tmux/init.sh

# Git
info zsh "Initialize Git config ..."
mklink $PWD/git/gitconfig ~/.gitconfig
mklink $PWD/git/gitignore ~/.gitignore

# Maven
info zsh "Initialize Maven config ..."
mkdir -p ~/.m2
mklink $PWD/config/maven-settings.xml ~/.m2/settings.xml

info zsh "Initialize eslint/taskwarrior/ripgrep/archey/wego/range/bottom/cheat config ..."

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
  sudo mklink $PWD/config/archey.json /etc/archey4/config.json
fi

# wego
mklink $PWD/config/wego ~/.wegorc

# ranger
mklink $PWD/config/ranger.conf ~/.config/ranger/rc.conf

# bottom
mkdir -p ~/.config/bottom
mklink $PWD/config/bottom.toml ~/.config/bottom/bottom.toml

# cheat
mkdir -p ~/.config/cheat
mklink $PWD/cheat/conf.yml ~/.config/cheat/conf.yml
mklink $PWD/cheat/personal ~/.config/cheat/cheatsheets/personal
