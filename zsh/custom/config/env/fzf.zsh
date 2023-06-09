if [[ $System == 'Darwin' ]]; then
  local BREW_PATH=$(brew --prefix)
  export FD="$BREW_PATH/bin/fd"
elif [[ $Distribution == 'Debian' ]]; then
  export FD="/usr/bin/fdfind"
fi

export FZF_COMPLETION_TRIGGER=",,"

export FZF_BINDINGS="--bind 'ctrl-a:toggle-all' --bind 'ctrl-b:preview-half-page-up' --bind 'ctrl-f:preview-half-page-down' --bind 'shift-up:preview-up' --bind 'shift-down:preview-down' --bind 'alt-up:half-page-up' --bind 'alt-down:half-page-down'"

export FZF_DEFAULT_COMMAND="$FD --type f --hidden --no-ignore-vcs --follow -E .git -E node_modules -E .DS_Store -E tags"

export FZF_FULLSCREEN_OPTIONS="--height=100%"
export FZF_FULLSCREEN_OPTS=$FZF_FULLSCREEN_OPTIONS

export FZF_OPTIONS="--layout=reverse --info=inline --separator='' --border=double --ansi --height=50% --cycle --scroll-off=2 --color=fg:-1,bg:-1,hl:#f4468f,fg+:#ffffff,bg+:#53355E,hl+:37,info:150,prompt:110,spinner:150,pointer:167,marker:174,gutter:#002B36,header:italic:underline,label:blue"
export FZF_OPTS_HISTORY=""
export FZF_OPTS_PREVIEW="--preview '\$DOTFILES/bin/parse_fzf_file {}'"

# --preview-window

# export FZF_DEFAULT_OPTS="$FZF_OPTIONS $FZF_OPTS_PREVIEW"
export FZF_DEFAULT_OPTS="$FZF_OPTIONS $FZF_BINDINGS"

# CTRL-T: list all files & directories
export FZF_CTRL_T_COMMAND="$FD --hidden --no-ignore-vcs --follow -E .git -E node_modules -E .DS_Store -E tags"
export FZF_CTRL_T_OPTS="$FZF_FULLSCREEN_OPTS $FZF_OPTS_PREVIEW --select-1 --exit-0 --prompt 'All > '
  --header 'ALT-D: Directories / ALT-F: Files'
  --bind 'alt-d:change-prompt(Directories > )+reload(eval $FZF_ALT_C_COMMAND)'
  --bind 'alt-f:change-prompt(Files > )+reload(eval $FZF_DEFAULT_COMMAND)'
  --bind 'ctrl-/:change-preview-window(down|hidden|right)'
"
# ALT-C: list all directories
export FZF_ALT_C_COMMAND="$FD --type d --hidden --no-ignore-vcs --follow -E .git -E node_modules -E .DS_Store -E tags"
export FZF_ALT_C_OPTS="$FZF_OPTS_PREVIEW
  --bind 'ctrl-/:change-preview-window(down|hidden|right)'
"

# CTRL-R: list zsh history
export FZF_CTRL_R_OPTS='--preview-window up:2:wrap --preview "print {} | sed -E '\''s/ *[0-9]*\\*? *//'\''"'
