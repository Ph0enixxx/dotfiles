if ! command -v goenv &> /dev/null; then
  return
fi

FZF_GOENV_OPTIONS="$FZF_FULLSCREEN_OPTIONS --no-preview --tac"
AWK_GOENV_FORMAT="awk '{ if (NR >1) print \$0 }'"

function zgoi() {
  local items=$(goenv install -l | eval $AWK_GOENV_FORMAT | fzf ${=FZF_GOENV_OPTIONS} --query="$1")

  if [[ $items ]] {
    for version in $(echo $items); do
      echo "$fg[blue]Install Go with version$reset_color $fg_bold[green]$version$reset_color"
      goenv install $version
    done
    zgoi
  }
}

function zgor() {
  local item=$(goenv versions | awk '$0 !~ /system/' | FZF_DEFAULT_OPTS="$FZF_GOENV_OPTIONS" fzf ${=FZF_FULLSCREEN_OPTIONS} --query="$1")

  if [[ $item ]] {
    if [[ $item == '*'* ]] {
      version=$(echo $item | awk '{ print $2 }')
      echo "Cannot uninstall currently-active go version: $fg_bold[red]$version$reset_color"
    } else {
      version=$(echo $item | eval $AWK_TRIM)
      echo "$fg[blue]Uninstall Go with version$reset_color $fg_bold[red]=$version=$reset_color"
      yes | goenv uninstall $version
    }
    zgor
  }
}

function zgo() {
  local item=$(goenv versions | FZF_DEFAULT_OPTS="$FZF_GOENV_OPTIONS" fzf ${=FZF_FULLSCREEN_OPTIONS} --query="$1")

  if [[ $item ]] {
    local version=$(echo $item | awk '{ if ($0 ~ /^[*]/) print $2; else print $1 }')
    echo "$fg[blue]Select a command:$reset_color"
    select input ("goenv global $version" "goenv shell $version" "goenv local $version") {
      echo $input
      eval $input
      break
    }
  }
}
