fpath=($DOTFILES/zsh/custom/completions $fpath)
fpath=($DOTFILES/zsh/autoload $fpath)

if command -v kubectl &> /dev/null; then
  source <(kubectl completion zsh)
fi

if command -v tsc &> /dev/null; then
  fpath=($DOTFILES/zsh/custom/config/completions $fpath)
fi

autoload -Uz compinit; compinit
