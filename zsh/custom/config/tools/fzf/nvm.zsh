AWK_NVM_VERSION="awk '{if (\$1 != \"->\") print \$1}'"

FZF_NVM_OPTIONS="--border --inline-info --ansi --reverse --no-preview --tac"

# [N]vm [L]atest LTS versions
zni() {
  local items=$(nvm list-remote --lts | awk '/\(Latest LTS:/{print $0}' | FZF_DEFAULT_OPTS="$FZF_NVM_OPTIONS" fzf ${=FZF_FULLSCREEN_OPTIONS} --multi)

  if [[ $items ]] {
    items=$(echo $items | eval $AWK_NVM_VERSION | eval $AWK_JOIN)
    typeset versions=(${(@s/ /)items})
    for version ($versions) {
      echo "nvm install $fg_bold[green]$version$reset_color"
      nvm install $version
      enable_node_pkg_manager
    }
    zni
  }
}

# [N]vm [A]ll [I]nstall
znai() {
  local items=$(nvm list-remote $1 | FZF_DEFAULT_OPTS="$FZF_NVM_OPTIONS" fzf ${=FZF_FULLSCREEN_OPTIONS} --multi)

  if [[ $items ]] {
    items=$(echo $items | eval $AWK_NVM_VERSION | eval $AWK_JOIN)
    typeset versions=(${(@s/ /)items})
    for version ($versions) {
      echo "nvm install $fg_bold[green]$version$reset_color"
      nvm install $version
      enable_node_pkg_manager
    }
    znai $1
  }
}

# [N]vm [R]emove
znr() {
  local version
  local item=$(nvm list --no-alias | FZF_DEFAULT_OPTS="$FZF_NVM_OPTIONS" fzf ${=FZF_FULLSCREEN_OPTIONS})
  if [[ $item ]] {
    if [[ $item == '->'* ]] {
      version=$(echo $item | awk '{ print $2 }')
      echo "Cannot uninstall currently-active node version: $fg_bold[red]$version$reset_color"
    } else {
      version=$(echo $item | eval $AWK_TRIM)
      echo "nvm uninstall $fg_bold[red]$version$reset_color"
      nvm uninstall $version
    }
    znr
  }
}

# [N]vm [U]se
znu() {
  local version
  local item=$(nvm list --no-alias | FZF_DEFAULT_OPTS="$FZF_NVM_OPTIONS" fzf ${=FZF_FULLSCREEN_OPTIONS})
  if [[ $item ]] {
    if [[ $item == '->'* ]] {
      version=$(echo $item | awk '{ print $2 }')
      echo "$fg_bold[blue]$version$reset_color is currently-active node version"
      znu
    } else {
      version=$(echo $item | eval $AWK_TRIM)
      echo "nvm use $fg_bold[green]$version$reset_color"
      nvm use $version
      enable_node_pkg_manager
    }
  }
}

# mnemonic F[Z]F [N]vm [R]e[I]nstall packages
znri() {
  local inst=$(nvm list --no-alias | fzf ${=FZF_FULLSCREEN_OPTIONS} --ansi -r +m --no-preview)

  if [[ $inst ]]; then
    echo "nvm reinstall-packages $inst"
    for prog in $(echo $inst);
    do; nvm reinstall-packages $prog; done;
  fi
}

