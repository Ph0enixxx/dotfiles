if ! command -v goenv &> /dev/null; then
  return
fi

FZF_GOENV_OPTIONS="$FZF_FULLSCREEN_OPTIONS --no-preview --tac"

#######################################
# [go]env [i]nstall
#######################################
function zgoi() {
  local versions
  while [[ -n "true" ]] {
    versions=$(goenv install -l | fzf ${=FZF_GOENV_OPTIONS} --header-lines=1 -m --query="$1") || return
    for version in $(echo $versions); do
      echo "$fg[blue]Install Go with version$reset_color $fg_bold[green]$version$reset_color"
      goenv install $version
    done
  }
}

#######################################
# [go]env [r]emove (uninstall)
#######################################
function zgor() {
  local version
  while [[ -n "true" ]] {
    version=$(goenv versions | awk '$0 !~ /system/' | fzf ${=FZF_GOENV_OPTIONS} +m --query="$1") || return
    if [[ $version == '*'* ]] {
      version=$(echo $version | awk '{ print $2 }')
      echo "Cannot uninstall currently-active go version: $fg_bold[red]$version$reset_color"
      read
    } else {
      version=$(echo $version | eval $AWK_TRIM)
      echo "$fg[blue]Uninstall Go with version$reset_color $fg_bold[red]$version$reset_color"
      yes | goenv uninstall $version
    }
  }
}

#######################################
# [go]env versions 
#######################################
function zgo() {
  local version
  while [[ -n "true" ]] {
    version=$(goenv versions | fzf ${=FZF_GOENV_OPTIONS} --query="$1") || return
    version=$(echo $version | awk '{ if ($0 ~ /^[*]/) print $2; else print $1 }')
    echo "$fg[blue]Select a command:$reset_color"
    select input ("goenv global $version" "goenv shell $version" "goenv local $version") {
      echo $input
      eval $input
      break
    }
  }
}
