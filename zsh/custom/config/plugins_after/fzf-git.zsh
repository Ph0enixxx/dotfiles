_fzf_git_fzf() {
  fzf-tmux -p 100%,100% --border \
    --layout=reverse --multi \
    --color='header:italic:underline' \
    --preview-window='right,60%,border-left' \
    --bind='ctrl-/:change-preview-window(down,50%,border-top|hidden|)' "$@"
}

