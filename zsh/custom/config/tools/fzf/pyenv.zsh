if ! command -v pyenv &>/dev/null; then
  debug 'pyenv command is not existed!'
  return
fi

# zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest' fzf-preview 'brew info $word'

FZF_PYENV_OPTIONS="$FZF_FULLSCREEN_OPTIONS --no-preview"

#######################################
# [p]yenv [i]nstall
#######################################
zpyi() {
  local items 
  local version
  while [[ -n "true" ]] {
    items=$(pyenv install -l | fzf ${=FZF_PYENV_OPTIONS} --header-lines=1 -m --query="$1") || return
    items=$(echo $items | eval $AWK_JOIN)
    typeset versions=(${(@s/ /)items})
    for version ($versions); do
      echo "$fg[blue]Install Python with version$reset_color $fg_bold[green]$version$reset_color"
      pyenv install $version
    done
  }
}

#######################################
# [p]yenv [r]emove (uninstall)
#######################################
zpyr() {
  local version
  local current=$(pyenv version-name)
  while [[ -n "true" ]] {
    version=$(pyenv whence 2to3 | fzf ${=FZF_PYENV_OPTIONS} +m --query="$1") || return
    if [[ $version == $current ]] {
      echo "Cannot uninstall currently-active python version: $fg_bold[red]$version$reset_color"
    } else {
      echo "pyenv uninstall $fg_bold[red]$version$reset_color"
      pyenv uninstall $version
    }
  }
}

#######################################
# [p]yenv [g]lobal
#######################################
zpyg() {
  local versions
  while [[ -n "true" ]] {
    versions=$(pyenv whence 2to3 | fzf ${=FZF_PYENV_OPTIONS} -m --query="$1") || return
    versions=$(echo $versions | eval $AWK_JOIN)
    echo "$fg[blue]pyenv global $fg_bold[green]$versions$reset_color"
    eval "pyenv global $versions"
  }
}

#######################################
# [p]yenv [l]ocal
#######################################
zpyl() {
  local versions
  while [[ -n "true" ]] {
    versions=$(pyenv whence 2to3 | fzf ${=FZF_PYENV_OPTIONS} -m --query="$1") || return
    versions=$(echo $versions | eval $AWK_JOIN)
    echo "$fg[blue]pyenv local $fg_bold[green]$versions$reset_color"
    eval "pyenv local $versions"
  }
}
