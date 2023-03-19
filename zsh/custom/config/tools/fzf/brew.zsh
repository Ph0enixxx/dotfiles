if ! command -v brew &> /dev/null; then
  return
fi

zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest' fzf-preview 'brew info $word'

#######################################
# [b]rew [i]nstall
#######################################
zbi() {
  local formulae="-"
  while [[ -n $formulae ]] {
    formulae=$(brew formulae | fzf ${=FZF_FULLSCREEN_OPTIONS} -m --query="$1" --preview 'brew info {}') || return
    local formulaeStr=$(echo $formulae | eval $AWK_JOIN)
    echo "$fg[blue]brew install $fg_bold[green]$formulaeStr$reset_color"
    brew install $formulaeStr
  }
}

#######################################
# [b]rew [c]ask [i]nstall
#######################################
zbci() {
  local formulae="-"
  while [[ -n $formulae ]] {
    formulae=$(brew casks | fzf ${=FZF_FULLSCREEN_OPTIONS} -m --query="$1" --preview 'brew info --cask {}') || return
    echo "$fg[blue]brew install --cask $fg_bold[green]${(f)formulae}$reset_color"
    brew install --cask ${(f)formulae}
  }
}


# [B]rew [U]pdate
zbu() {
  local formulae
  formulae=$(brew leaves | fzf ${=FZF_FULLSCREEN_OPTIONS} -m --query="$1" --preview 'brew list {}') || return

  echo "brew upgrade 1${formulae}1"
  brew upgrade ${(f)formulae}
  zbu
}

# [B]rew [R]emove
zbr() {
  local all=$(brew leaves)
  local formulae=$(echo $all | fzf ${=FZF_FULLSCREEN_OPTIONS} -m --query="$1" --preview 'brew info {}; echo "\nInstalled Files:\n"; brew list {}')
  while [[ "$formulae" != "" ]] {
    local formulaeStr=$(echo $formulae | eval $AWK_JOIN)
    echo "brew uninstall $formulaeStr"
    eval "brew uninstall $formulaeStr"
    formulae=$(echo $all | fzf ${=FZF_FULLSCREEN_OPTIONS} -m --query="$1" --preview 'brew info {}; echo "\nInstalled Files:\n"; brew list {}')
  }
}

# [B]rew [C]ask [R]emove
zbcr() {
  local all=$(brew list --cask)
  local formulae=$(echo $all | fzf ${=FZF_FULLSCREEN_OPTIONS} -m --query="$1" --preview 'brew info {}')
  while [[ -n $formulae ]] {
    local formulaeStr=$(echo $formulae | eval $AWK_JOIN)
    echo "brew uninstall $formulaeStr"
    eval "brew uninstall --cask $formulaeStr"
    formulae=$(echo $all | fzf ${=FZF_FULLSCREEN_OPTIONS} -m --query="$1" --preview 'brew info {}')
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
