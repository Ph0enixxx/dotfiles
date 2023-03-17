if ! command -v fzf &> /dev/null; then
  return
fi

export FZF_BINDINGS="--bind 'ctrl-a:toggle-all'
  --bind 'ctrl-b:preview-half-page-up' --bind 'ctrl-f:preview-half-page-down'
  --bind 'shift-up:preview-up'         --bind 'shift-down:preview-down'
  --bind 'alt-up:half-page-up'         --bind 'alt-down:half-page-down'
"

export FZF_OPTIONS="--layout=reverse --info=inline --ansi --border
  --height=50%
  --cycle
  --color=fg:-1,bg:-1,hl:33
  --color=fg+:#ffffff,bg+:#53355E,hl+:37
  --color=info:150,prompt:110,spinner:150,pointer:167,marker:174,gutter:#002B36
"
export FZF_DEFAULT_OPTS="$FZF_OPTIONS $FZF_BINDINGS"
