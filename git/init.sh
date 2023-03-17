#!/usr/bin/env bash

source ../utils.sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mklink $DIR/gitconfig ~/.gitconfig
mklink $DIR/gitignore ~/.gitignore
