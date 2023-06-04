if ! command -v docker &>/dev/null; then
  debug 'docker command is not existed!'
  return
fi

AWK_DOCKER_FORMAT="awk '{ if (NR > 1) print \$1\":\"\$2 }'"

# [D]ocker [I]mage
function zdi() {
  local image='-'
  while [[ -n $image ]] {
    image=$(sudo docker image ls | fzf +m --height=100%  --nth=1,2,3 --query="$1" --header-lines=1 --preview 'sudo docker image inspect {3} | highlight -O ansi -s solarized-dark -S json' \
      --color='header:italic:underline,label:blue' \
      --header $'CTRL-O (open in browser) / ALT-D (delete)\n\n' \
      --bind "ctrl-o:execute-silent:open https://hub.docker.com/_/{1}" \
      --bind "alt-d:execute:__remove_docker_image {3}" \
      --bind "alt-o:execute:echo __remove_docker_image" \
      --border-label '   Docker Image List ') || return
    image=$(awk '{print $3}'<<<$image)
    echo $image
  }
}

function __remove_docker_image() {
  read -q "choice?Remove image: {}? [y/N]"
  if [[ $choice == 'y' ]]; then
    sudo docker image rm $1
  fi
}

# [D]ocker [C]ontainer
function zdc() {
  local container=$(sudo docker container ls |fzf +m --height=100% --header-lines=1 \
    --query="$1" --preview-window right:50% --preview 'sudo docker container inspect {1} --size | highlight -O ansi -s solarized-dark -S json')
  echo $container
}

# [D]ocker [S]earch
function zds() {
  local input=$1
  if [[ ! $input ]] {
    echo "$fg_bold[green]Please input the search term:$reset_color"
    read input
  }
  local image='-'
  while [[ -n $image ]] {
    image=$(sudo docker search --no-trunc --limit=100 $input | fzf +m --no-preview --height=100% --nth=1,2 --header-lines=1 \
      --header $'Enter (pull image) ╱ CTRL-O (open in browser)\n\n' \
      --color='header:italic:underline,label:blue' \
      --bind "ctrl-o:execute-silent:if [[ {1} =~ '/' ]]; then open https://hub.docker.com/r/{1}; else open https://hub.docker.com/_/{1}; fi;" \
      --border-label '   Docker Image Search ') || return
    image=$(awk '{print $1}'<<<$image)
    echo "$fg_bold[green]docker pull $fg_bold[blue]$image$reset_color"
    sudo docker pull $image
  }
}

