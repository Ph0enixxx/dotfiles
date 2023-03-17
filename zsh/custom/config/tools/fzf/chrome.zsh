# [C]hrome [H]istory
zch() {
  ! [[ -d /tmp/fzf ]] && mkdir /tmp/fzf
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  yes | cp -f ~/Library/Application\ Support/Google/Chrome/Profile\ 1/History /tmp/fzf/zch

  sqlite3 -separator $sep /tmp/fzf/zch \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi --preview-window up:3:wrap --preview "print {}" | sed 's#.*\(https*://\)#\1#' | xargs open
}

# [C]hrome [B]ookmarks
zcb() {
  ! [[ -d /tmp/fzf ]] && mkdir /tmp/fzf
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  yes | cp -f ~/Library/Application\ Support/Google/Chrome/Profile\ 1/Bookmarks /tmp/fzf/zcb

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open

}
