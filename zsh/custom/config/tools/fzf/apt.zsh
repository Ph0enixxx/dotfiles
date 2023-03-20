if ! command -v apt-get &> /dev/null; then
  return
fi

APT_FORMAT="awk -F\"/\" '{ if (NR > 1) print \$1 }'"

# [A]pt [I]nstall
function zai() {
  local packages=$(apt list | eval $APT_FORMAT | fzf ${=FZF_FULLSCREEN_OPTIONS} -m --query="$1" --preview 'apt list -a {} && apt-cache show {}')

  if [[ $packages ]]; then
    local packagesStr=$(echo $packages | eval $AWK_JOIN)
    echo "Install: $packagesStr"
    eval "sudo apt-get install $packagesStr"
    zai
  fi
}

# [A]pt [R]emove
function zar() {
  local packages=$(apt list --installed | eval $APT_FORMAT | fzf ${=FZF_FULLSCREEN_OPTIONS} -m --query="$1" --preview 'apt list -a {} && apt-cache show {}')
  if [[ $packages ]]; then
    local packagesStr=$(echo $packages | eval $AWK_JOIN)
    echo "Remove: $packagesStr"
    eval "sudo apt-get autoremove $packagesStr"
    zar
  fi
}
