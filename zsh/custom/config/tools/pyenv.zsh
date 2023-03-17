# export LDFLAGS="-L$(brew --prefix zlib)/lib"
# export CPPFLAGS="-I$(brew --prefix zlib)/include"

if [[ -d "$HOME/.pyenv" ]]; then
  debug "pyenv is installed ..."
  export PYENV_ROOT=$HOME/.pyenv
  if ! command -v pyenv &> /dev/null; then
    export PATH=$PYENV_ROOT/bin:$PATH
  fi
  if command -v pyenv &> /dev/null; then
    debug 'pyenv is available ...'
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
  fi
fi

