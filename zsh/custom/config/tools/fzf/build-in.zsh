function zifconfig() {
  local interfaces=$(ifconfig -l | eval $AWK_SPLIT_SPACE)
  local interface
  interface=$(echo $interfaces |
    fzf ${=FZF_FULLSCREEN_OPTIONS} --query "$1" \
      --color='header:italic:underline' \
      --color hl:underline,hl+:underline \
      --preview 'ifconfig {}') \
    || return
}
