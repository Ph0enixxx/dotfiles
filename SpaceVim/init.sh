#!/usr/bin/env bash

# link config files
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VIMRC=$HOME/.SpaceVim.d

source $DIR/../utils.sh

mkdir -p $HOME/.config/coc
mkdir -p $HOME/.SpaceVim.d

if [[ ! -d $HOME/.SpaceVim ]]; then
  curl -fLs https://spacevim.org/install.sh | bash
fi

# vim config
mklink $DIR/after    $VIMRC/after
mklink $DIR/autoload $VIMRC/autoload
mklink $DIR/ftdetect $VIMRC/ftdetect
mklink $DIR/ftplugin $VIMRC/ftplugin
mklink $DIR/indent   $VIMRC/indent
mklink $DIR/keymap   $VIMRC/keymap
mklink $DIR/plugin   $VIMRC/plugin
mklink $DIR/syntax   $VIMRC/syntax
mklink $DIR/lib      $VIMRC/lib
mklink $DIR/lua      $VIMRC/lua

# coc config
mklink $DIR/coc-settings.json $VIMRC/coc-settings.json
mklink $DIR/coc-project.json $VIMRC/coc-project.json
mklink $DIR/UltiSnips ~/.config/coc/ultisnips

# spacevim config
mklink $DIR/init.toml $VIMRC/init.toml

# data
mklink $DIR/vim-bookmarks.vim $VIMRC/vim-bookmarks.vim

# plugins
mklink $DIR/bundle $VIMRC/bundle
