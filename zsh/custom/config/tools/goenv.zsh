export GOENV_ROOT="$HOME/.goenv"

typeset -gU path
path=($GOENV_ROOT/bin $PATH "$path[@]")

if [[ ! -f "$GOENV_ROOT/bin/goenv" ]] {
  info zsh "Install goenv ..."
  git clone https://github.com/syndbg/goenv.git ~/.goenv
}

eval "$(goenv init -)"

path=($GOROOT/bin "$path[@]")
path=("$path[@]" $GOPATH/bin)

alias goenv-upgrade="cd $GOENV_ROOT && git fetch --all && git pull"
