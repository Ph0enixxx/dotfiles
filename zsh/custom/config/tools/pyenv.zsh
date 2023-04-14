if [[ -d "$HOME/.pyenv" ]]; then
  debug "pyenv is installed ..."
  if command -v pyenv &> /dev/null; then
    debug 'pyenv is available ...'
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
  fi
fi

