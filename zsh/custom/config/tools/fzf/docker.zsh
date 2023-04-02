if ! command -v docker &>/dev/null; then
  debug 'docker command is not existed!'
  return
fi

DOCKER_FORMAT="awk '{ if (NR > 1) print \$1\":\"\$2 }'"

FZF_OPTS="--height=100% --header-lines=1"

# [D]ocker [I]mage
function zdi() {
  local image=$(docker image ls | fzf -m ${(z)FZF_OPTS} --nth=1,2,3 --query="$1" --preview 'docker image inspect {3} | highlight -O ansi -s solarized-dark -S json')
  echo container
}


# [D]ocker [C]ontainer
function zdc() {
  local container=$(docker container ls |fzf +m ${(z)FZF_OPTS} \
    --query="$1" --preview-window right:50% --preview 'docker container inspect {1} --size | highlight -O ansi -s solarized-dark -S json')
  echo $container
}
