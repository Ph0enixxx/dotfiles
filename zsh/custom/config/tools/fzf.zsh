if ! command -v fzf &> /dev/null; then
  return
fi

# just env path
try_source ~/.fzf.zsh

if [[ $Distribution == 'Debian' ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi

_fzf_compgen_path() {
  eval ${FZF_DEFAULT_COMMAND} . "$1"
}

_fzf_compgen_dir() {
  eval "$FD --type d --hidden --no-ignore-vcs --follow -E .git -E node_modules -E .DS_Store -E tags" . "$1"
}

v() {
  IFS=$'\n' files=($(fzf --query="$1" --height 100% --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

f() {
  IFS=$'\n' out=("$(fzf --query="$1" --height 100% --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

# fuzzy grep open via ag with line number
zrg() {
  local params=$@
  if [[ -z $params ]] {
    echo "$fg_bold[magenta]Please input the search pattern and options for ripgrep$reset_color"
    return
  }
  local file
  local line

  read -r file line <<<"$(rg --no-heading $@ | fzf -0 -1 ${(z)FZF_FULLSCREEN_OPTIONS} --preview-window up:2:wrap --preview 'print {}' | awk -F: '{print $1, $2}')"

  if [[ -n $file ]]
  then
     vim $file +$line
  fi
}

# fcd - cd to selected directory
zcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

zcdp() {
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf --tac)
  cd "$DIR"
}

# Utilize FZF
alias lspath='echo $PATH | eval $AWK_SPLIT_COLON | fzf'
alias fzfl='fzf --header-lines=1'
alias fzfn='fzf --no-preview'

