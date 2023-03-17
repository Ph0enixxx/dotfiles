#!/usr/bin/env bash

source ../utils.sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -d ~/.tmux ]; then
  mv ~/.tmux ~/.tmux_bkp
fi

cd
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mklink ~/.tmux/.tmux.conf ~/.tmux.conf
mklink $DIR/tmux.conf ~/.tmux.conf.local
