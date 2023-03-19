function getInstallCmd ()
{
  echo "$cli $option"
}

# [PN]pm [I]nstall
zpni() {
  local input=$1
  if [[ ! $1 ]] {
    echo "$fg_bold[green]Please input the search word:$reset_color"
    read input
  }

  local items="-"
  
  while [[ $items ]] {
    items=$(npm search --searchlimit=200 --searchopts=sortBy=popularity react | awk -F "|" "{print \$1 \$2 \$5 \$6}" | fzf ${=FZF_FULLSCREEN_OPTIONS} --header-lines=1 --nth=1,2,4 --ansi -m --preview "npm view --color {1}") || return
    local deps=$(echo $items | eval $AWK_TRIM | eval $AWK_JOIN)

    local cli="pnpm add"
    echo "$fg_bold[green]Install as which type$reset_color: [$fg_bold[blue]g$reset_color]lobal, [$fg_bold[blue]d$reset_color]ependencie, dev[$fg_bold[blue]D$reset_color]ependencies, [$fg_bold[blue]p$reset_color]eerDependencies, [$fg_bold[blue]o$reset_color]ptionalDependencies, [$fg_bold[blue]e$reset_color]xact dependencies, [$fg_bold[blue]b$reset_color]undleDependencies ?"
    read input
    if [[ $input = "g" ]]; then
      local option="--global"
    elif [[ $input = "d" ]]; then
      local option="--save-prod"
    elif [[ $input = "D" ]]; then
      local option="--save-dev"
    elif [[ $input = "p" ]]; then
      local option="--save-peer"
    elif [[ $input = "o" ]]; then
      local option="--save-optional"
    elif [[ $input = "e" ]]; then
      local option="--save-exact"
    elif [[ $input = "b" ]]; then
      local option="--save-bundle"
      local cli="npm install"
    fi

    echo "$fg_bold[blue]$cli $option $deps$reset_color"
    # eval "$cmd $deps"
  }
}
