if ! command -v archey &> /dev/null || (($+SSH_CLIENT)); then
  return
fi

if (($+TMUX)) && (($(tmux list-panes | eval $AWK_NR) > 1)); then
  return
fi


if [[ $System == 'Darwin' ]]; then
  archey -l retro
else
  archey
fi
