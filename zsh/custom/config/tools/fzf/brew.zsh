if ! command -v brew &> /dev/null; then
  return
fi

zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest' fzf-preview 'brew info $word'

#######################################
# [b]rew [i]nstall
#######################################
zbi() {
  local formulae="-"
  while [[ -n "true" ]] {
    formulae=$(brew formulae | fzf ${=FZF_FULLSCREEN_OPTIONS} -m --query="$1" --preview 'brew info {}') || return
    echo "$fg[blue]brew install $fg_bold[green]${(f)formulae}$reset_color"
    brew install ${(f)formulae}
  }
}

#######################################
# [b]rew [c]ask [i]nstall
#######################################
zbci() {
  local formulae="-"
  while [[ -n "true" ]] {
    formulae=$(brew casks | fzf ${=FZF_FULLSCREEN_OPTIONS} -m --query="$1" --preview 'brew info --cask {}') || return
    echo "$fg[blue]brew install --cask $fg_bold[green]${(f)formulae}$reset_color"
    brew install --cask ${(f)formulae}
  }
}

#######################################
# [b]rew [u]pdate
#######################################
zbu() {
  local formulae='-'
  while [[ -n "true" ]] {
    formulae=$(brew leaves | fzf ${=FZF_FULLSCREEN_OPTIONS} -m --query="$1" --preview 'brew list {}') || return
    echo "$fg[megnet]brew uninstall $fg[green]${(f)formulae}$reset_color"
    brew upgrade ${(f)formulae}
  }
}

#######################################
# [b]rew [r]emove
#######################################
zbr() {
  local formulae='-'
  while [[ -n "true" ]] {
    formulae=$(brew leaves | fzf ${=FZF_FULLSCREEN_OPTIONS} -m --query="$1" --preview 'brew info {}; echo "\nInstalled Files:\n"; brew list {}') || return
    echo "$fg[red]brew uninstall $fg[green]${(f)formulae}$reset_color"
    brew uninstall ${(f)formulae}
  }
}

#######################################
# [b]rew [c]ask [r]emove
#######################################
zbcr() {
  local formulae='-'
  while [[ -n $formulae ]] {
    formulae=$(brew list --cask | fzf ${=FZF_FULLSCREEN_OPTIONS} -m --query="$1" --preview 'brew info {}; echo "\nInstalled Files:\n"; brew list {}') || return
    echo "$fg[red]brew uninstall --cask $fg[green]${(f)formulae}$reset_color"
    brew uninstall --cask ${(f)formulae}
  }
}


#######################################
# [b]rew [s]ervice
#######################################
function zbs() {
  local service="$"
  while [[ -n service ]] {
    service=$(brew services list | fzf ${=FZF_FULLSCREEN_OPTIONS} +m --header-lines="1" --query="$1" --no-preview) || return
    echo $service
  }
}
