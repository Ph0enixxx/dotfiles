if [[ $System == 'Darwin' ]]; then
  local BREW_PATH=$(brew --prefix)
  export FD="$BREW_PATH/bin/fd"
elif [[ $Distribution == 'Debian' ]]; then
  export FD="/usr/bin/fdfind"
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

export FZF_OPTIONS="--layout=reverse --info=inline --separator='' --border=double --ansi
  --height=50%
  --cycle --scroll-off=2
  --color=fg:-1,bg:-1,hl:#f4468f
  --color=fg+:#ffffff,bg+:#53355E,hl+:37
  --color=info:150,prompt:110,spinner:150,pointer:167,marker:174,gutter:#002B36
"

export FZF_OPTS_HISTORY=""
export FZF_OPTS_PREVIEW="--preview '([[ \$(file --mime {}) =~ directory ]] && exa --tree --all --color=always --group-directories-first -I \"node_modules|.git|.DS_Store\" --icons {}) ||
    ([[ \$(file --mime {}) =~ image ]] && chafa -c full --size=80 {} && exiftool {}) ||
    ([[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file) ||
    (highlight -O ansi -s solarized-dark {} 2>/dev/null || cat {}) 2>/dev/null'
"

  # --preview-window

export FZF_DEFAULT_OPTS="$FZF_OPTIONS $FZF_BINDINGS"

# CTRL-T: list all files & directories
export FZF_CTRL_T_COMMAND="$FD --hidden --no-ignore-vcs --follow -E .git -E node_modules -E .DS_Store -E tags"
export FZF_CTRL_T_OPTS="$FZF_OPTS_PREVIEW --select-1 --exit-0 --prompt 'All > '
  --height=100%
  --header 'ALT-D: Directories / ALT-F: Files\\n'
  --bind 'alt-d:change-prompt(Directories > )+reload(eval $FZF_ALT_C_COMMAND)'
  --bind 'alt-f:change-prompt(Files > )+reload(eval $FZF_DEFAULT_COMMAND)'
"
# ALT-C: list all directories
export FZF_ALT_C_COMMAND="$FD --type d --hidden --no-ignore-vcs --follow -E .git -E node_modules -E .DS_Store -E tags"
export FZF_ALT_C_OPTS="$FZF_OPTS_PREVIEW"

# CTRL-R: list zsh history
export FZF_CTRL_R_OPTS='--preview-window up:2:wrap --preview "print {} | sed -E '\''s/ *[0-9]*\\*? *//'\''"'
