if [[ ! -f "$GOENV_ROOT/bin/goenv" ]] {
  info zsh "Install goenv ..."
  git clone https://github.com/syndbg/goenv.git ~/.goenv
}

alias upgrade-goenv="cd $GOENV_ROOT && git fetch --all && git pull"
