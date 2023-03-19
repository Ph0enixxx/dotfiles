# Install (one or multiple) selected application(s)
# using "brew search" as source input
# mnemonic [B]rew [I]nstall [P]lugin
zpi() {
  local inst=$(pyenv install --list | sed "{1d;s/^[ ]*//;}" | fzf -m --query="$1" --no-preview)

  if [[ $inst ]]; then
    for prog in $(echo $inst);
    do; echo $prog; pyenv install $prog; done;

    zpi
  fi
}
