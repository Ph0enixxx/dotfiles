if ! command -v fzf &> /dev/null; then
  return
fi

# just env path
try_source ~/.fzf.zsh

if [[ $System == 'Darwin' ]]; then
  local BREW_PATH=$(brew --prefix)
  export FD="$BREW_PATH/bin/fd"
  # source $BREW_PATH/opt/fzf/shell/key-bindings.zsh
  # source $BREW_PATH/opt/fzf/shell/completion.zsh
elif [[ $Distribution == 'Debian' ]]; then
  export FD="/usr/bin/fdfind"
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi

export FZF_COMPLETION_TRIGGER=",,"

export FZF_BINDINGS="--bind 'ctrl-a:toggle-all'
  --bind 'ctrl-b:preview-half-page-up' --bind 'ctrl-f:preview-half-page-down'
  --bind 'shift-up:preview-up'         --bind 'shift-down:preview-down'
  --bind 'alt-up:half-page-up'         --bind 'alt-down:half-page-down'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
"

export FZF_DEFAULT_COMMAND="$FD --type f --hidden --no-ignore-vcs --follow -E .git -E node_modules -E .DS_Store -E tags"

export FZF_FULLSCREEN_OPTIONS="--height=100%"

export FZF_OPTIONS="--layout=reverse --info=inline --separator='' --border=bold --ansi
  --height=50%
  --cycle --scroll-off=2
  --color=fg:-1,bg:-1,hl:33
  --color=fg+:#ffffff,bg+:#53355E,hl+:37
  --color=info:150,prompt:110,spinner:150,pointer:167,marker:174,gutter:#002B36
"

export FZF_OPTS_HISTORY=""
export FZF_OPTS_PREVIEW="--preview '([[ \$(file --mime {}) =~ directory ]] && exa --tree --all --color=always --group-directories-first -I \"node_modules|.git|.DS_Store\" --icons {}) ||
    ([[ \$(file --mime {}) =~ image ]] && echo {} is an image file) ||
    ([[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file) ||
    (highlight -O ansi -s solarized-dark {} 2>/dev/null || cat {}) 2>/dev/null'
"

  # --preview-window

export FZF_DEFAULT_OPTS="$FZF_OPTIONS $FZF_BINDINGS"

# CTRL-T: list all files & directories
export FZF_CTRL_T_COMMAND="$FD --hidden --no-ignore-vcs --follow -E .git -E node_modules -E .DS_Store -E tags"
export FZF_CTRL_T_OPTS="$FZF_OPTS_PREVIEW --select-1 --exit-0 --prompt 'All > '
  --header 'ALT-D: Directories / ALT-F: Files\\n'
  --bind 'alt-d:change-prompt(Directories > )+reload(eval $FZF_ALT_C_COMMAND)'
  --bind 'alt-f:change-prompt(Files > )+reload(eval $FZF_DEFAULT_COMMAND)'
"
# ALT-C: list all directories
export FZF_ALT_C_COMMAND="$FD --type d --hidden --no-ignore-vcs --follow -E .git -E node_modules -E .DS_Store -E tags"
export FZF_ALT_C_OPTS="$FZF_OPTS_PREVIEW"

# CTRL-R: list zsh history
export FZF_CTRL_R_OPTS='--preview-window up:2:wrap --preview "print {} | sed -E '\''s/ *[0-9]*\\*? *//'\''"'

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
zag() {
  local file
  local line

  read -r file line <<<"$(ag --nobreak --noheading $@ | fzf -0 -1 --preview-window up:2:wrap --preview 'print {}' | awk -F: '{print $1, $2}')"

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

alias fzfn='fzf --no-preview'
