if ! command -v pyenv &>/dev/null; then
  debug 'pyenv command is not existed!'
  return
fi

# [P]yenv [I]nstall
zpi() {
  local inst=$(pyenv install --list | sed "{1d;s/^[ ]*//;}" | fzf -m --query="$1" --no-preview)

  if [[ $inst ]]; then
    for prog in $(echo $inst);
    do; echo $prog; pyenv install $prog; done;

    zpi
  fi
}
