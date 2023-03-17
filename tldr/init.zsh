#!/usr/bin/env zsh

if { ! command -v tldr &> /dev/null } {
  return
}

source ../utils.sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tldr --update

if [[ $System == 'Darwin' ]] {
  export TLDR_CONFIG="$HOME/Library/Application Support/tealdeer/"
} elif [[ $Distribution == 'Debian' ]] {
  # TODO
}

mkdir -p $TLDR_CONFIG
mklink $DIR/config.toml $TLDR_CONFIG/config.toml
mklink $DIR/pages $TLDR_CONFIG/pages

