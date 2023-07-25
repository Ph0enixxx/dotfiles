if ! command -v tmux &> /dev/null; then
  return
fi
if (( $+TMUX )) || (( $+SSH_CLIENT )) || (( $+TMUX_DISABLE )); then
  return
fi

if [[ $ITERM_PROFILE == "no-tmux" ]]; then
  return
fi

local unattached_session=$(tmux list-sessions | awk -F: '{ if($0 !~ /\(attached\)$/) print $1; }' | head -n 1)
if [[ "$unattached_session" != "" ]] ; then
  debug 'tmux' 'try attach session: $unattached_session'
  tmux attach-session -t $unattached_session
else
  tmux
fi

