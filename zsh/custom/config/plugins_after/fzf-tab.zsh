if ! command -v enable-fzf-tab &> /dev/null; then
  return
fi

enable-fzf-tab

# set descriptions format to enable group support
# zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# disable sort when completing options of any command
# zstyle ':completion:complete:*:options' sort false

# disable sort when completing `git checkout`
# zstyle ':completion:*:git-checkout:*' sort false

zstyle ':fzf-tab:*' fzf-command fzf
zstyle ':fzf-tab:*' show-group full
zstyle ':fzf-tab:*' switch-group '[' ']'


zstyle ':fzf-tab:complete:*:*' fzf-preview 'parse_fzf_tab "$desc" "$word" "$group" "$realpath" "$words"'
# zstyle ':fzf-tab:complete:*:argument-rest' fzf-preview 'parse_fzf_tab "$desc" "$word" "$group" "$realpath" "$words"'
zstyle ':fzf-tab:complete:*:options' fzf-preview
zstyle ':fzf-tab:complete:-command-:*' fzf-preview 'parse_fzf_tab_cmd "$desc" "$word" "$group" "$realpath" "$words"'
zstyle ':fzf-tab:complete:(-tilde-):*' fzf-preview
zstyle ':fzf-tab:complete:(-parameter-|-brace-parameter-|export|unset|expand):*' fzf-flags '--preview-window=top:5:wrap'
zstyle ':fzf-tab:complete:(-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo "$"$word=${(P)word} | highlight -O ansi -s solarized-dark --syntax=zsh'


# Git
zstyle ':fzf-tab:complete:git:argument-1' fzf-preview 'parse_fzf_tab_git "$desc" "$word" "$group" "$realpath"'
# zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview '$_viewGitLogLine'

# Docker
zstyle ':fzf-tab:complete:docker:*' fzf-preview 'parse_fzf_tab_docker "$desc" "$word" "$group" "$realpath"'

zstyle ':fzf-tab:complete:*' fzf-pad 10
zstyle ':fzf-tab:complete:*' fzf-flags --height=50%


# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# zstyle ':fzf-tab:complete:pnpm:*:options' fzf-preview 'echo $desc'

# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa --tree --all --color=always --group-directories-first -I "node_modules|.git|.DS_Store" --icons $realpath'
# zstyle ':fzf-tab:complete:*:directories' fzf-preview 'exa --tree --all --color=always --group-directories-first -I "node_modules|.git|.DS_Store" --icons $realpath'
# zstyle ':fzf-tab:complete:nvim:*' fzf-preview '([[ $(file --mime $realpath) =~ directory ]] && tree -C $realpath | head -200 | ascii2uni -a K -q) \
    # || ([[ $(file --mime $realpath) =~ binary ]] && echo $realpath is a binary file) \
    # || (rougify --theme base16.solarized.dark $realpath || cat $realpath)'

# zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0

# give a preview of commandline arguments when completing `kill`
# kill / ps
# zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps -p $word -o pid,%cpu,%mem,comm -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags '--preview-window=top:3:wrap'
# zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# systemctl 
if { command -v systemctl &> /dev/null } {
  zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
}

# zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-flags '--preview-window=top:3:wrap'
zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest' fzf-preview 'brew info $word'

if { command -v tldr &> /dev/null } {
  zstyle ':fzf-tab:complete:tldr:argument-1' fzf-preview 'tldr --color always $word'
}
