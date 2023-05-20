if ! command -v borg &> /dev/null; then
  return
fi

# [B]org [L]ist
function zbgl {
  local archive='-'
  local repo=${1:-$BORG_REPO}
  while [[ -n $archive ]] {
    archive=$(borg list $repo | fzf ${=FZF_FULLSCREEN_OPTIONS} --prompt='Borg List: ' --preview="borg info $repo::{1} && echo \"\\n$fg_bold[cyan]Files$reset_color:\" && borg list --short $repo::{1}" --preview-window=right:60%) || return
  }
}
