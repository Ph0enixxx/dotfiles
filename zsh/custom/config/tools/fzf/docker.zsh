if ! command -v docker &>/dev/null; then
  debug 'docker command is not existed!'
  return
fi

DOCKER_FORMAT="awk '{ if (NR > 1) print \$1\":\"\$2 }'"

FZF_OPTS="--height=100% --header-lines=1"

# --preview-window='right,60%,border-left'

# [D]ocker [I]mage
function zdi() {
  local packages=$(docker image ls | fzf -m ${(z)FZF_OPTS} --nth=1,2,3 --query="$1" --preview 'docker image inspect {3} | highlight -O ansi -s solarized-dark -S json')
}

# [D]ocker [C]ontainer
function zdc() {
  local packages=$(docker container ls |fzf -m ${(z)FZF_OPTS} --query="$1" --preview 'docker image inspect {} | highlight -O ansi -s solarized-dark -S json')
}
