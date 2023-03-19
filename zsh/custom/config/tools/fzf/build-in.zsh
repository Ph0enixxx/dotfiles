function zifconfig() {
  local interfaces=$(ifconfig -l | eval $AWK_SPLIT_SPACE)
  local interface
  interface=$(echo $interfaces |
    fzf ${=FZF_FULLSCREEN_OPTIONS} --query "$1" \
      --header $'CTRL-O (open in browser)\n\n' \
      --color='header:italic:underline' \
      --color hl:underline,hl+:underline \
      --preview 'ifconfig {}') \
    || return
}
