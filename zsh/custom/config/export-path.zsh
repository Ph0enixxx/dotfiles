# goenv
path=($GOENV_ROOT/bin "$path[@]")
path=($GOROOT/bin "$path[@]")
path=("$path[@]" $GOPATH/bin)

# cargo
if [[ -d $HOME/.cargo ]] {
  path=($HOME/.cargo/bin "$path[@]")
}

# pyenv
path=($PYENV_ROOT/bin "$path[@]")
if command -v pyenv &> /dev/null; then
  debug 'pyenv is available ...'
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# pnpm
if [[ $System == "Darwin" ]] {
  export PNPM_HOME="$HOME/Library/pnpm"
} elif [[ $System == "Linux" ]] {
  export PNPM_HOME="$HOME/.local/share/pnpm"
}
path=($PNPM_HOME "$path[@]")
# pnpm end
#
# user defined
path=($DOTFILES/bin "$path[@]")
path=($HOME/bin "$path[@]")

# local folder
path=(./node_modules/.bin "$path[@]")