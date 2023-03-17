# Enable zsh autocompletion.
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE

# Completion caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompcache"
zstyle ':completion:*' menu yes select
# zstyle ':completion:*:*:*:default' menu yes select

# zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands

zstyle ':completion:*' verbose yes

# Completion Options
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# Path Expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'
zstyle ':completion:*:*:default' force-list always



# GNU Colors 需要/etc/DIR_COLORS文件 否则自动补全时候选菜单中的选项不能彩色显示
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# kill & pkill
compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*:*' menu yes select
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,%cpu,%mem,comm -w"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# cd
#zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Group matches and Describe
zstyle ':completion:*:matches' group yes
zstyle ':completion:*:options' description yes
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:messages' format '%F{blue}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- No Matches Found --%f'

# Gulp
function _gulp_completion() {
  # Grab tasks
  compls=$(gulp --tasks-simple)
  completions=(${=compls})
  compadd -- $completions
}

compdef _gulp_completion gulp


# bit
function _bit_yargs_completions() {
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" bit --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _bit_yargs_completions bit
