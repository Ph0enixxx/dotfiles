_fzf_git_fzf() {
  fzf-tmux -p 100%,100% --border \
    --layout=reverse --multi \
    --color='header:italic:underline,label:blue' \
    --preview-window='right,60%,border-left' \
    --bind='ctrl-/:change-preview-window(down,50%,border-top|hidden|)' "$@"
}

_fzf_git_hashes() {
  _fzf_git_check || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  _fzf_git_fzf --ansi --no-sort --bind 'ctrl-s:toggle-sort' \
    --border-label '🍡 Hashes' \
    --header $'CTRL-O (open in browser) ╱ CTRL-D (diff) ╱ CTRL-S (toggle sort)\n\n' \
    --bind "ctrl-o:execute-silent:bash $__fzf_git commit {}" \
    --bind 'ctrl-d:execute:grep -o "[a-f0-9]\{7,\}" <<< {} | head -n 1 | xargs git diff > /dev/tty' \
    --color hl:underline,hl+:underline \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | head -n 1 | xargs git show' "$@" |
  awk 'match($0, /[a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9]*/) { print substr($0, RSTART, RLENGTH) }'
}

    # --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | head -n 1 | xargs git show --color=always' "$@" |
    # --color='header:italic:underline' \
