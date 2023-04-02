fpath=($DOTFILES/zsh/custom/completions $fpath)
fpath=($DOTFILES/zsh/autoload $fpath)

if command -v kubectl &> /dev/null; then
  source <(kubectl completion zsh)
fi
