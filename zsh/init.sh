#!/usr/bin/env bash

DIR=`cd $(dirname $0); pwd`

if ! command -v mklink &> /dev/null; then
  source ../utils.sh
fi

function switch_shell_zsh() {
  # Change defautl shell to ZSH
  local zsh_shell=$(which zsh)
  if ! cat /etc/shells | grep $zsh_shell &> /dev/null; then
    sudo sh -c "echo $(which zsh) >> /etc/shells"
  fi
  
  if [[ $SHELL != $zsh_shell ]]; then
    chsh -s $zsh_shell
  fi
}

switch_shell_zsh

if [[ -z $ZSH ]]; then
  echo "Install oh-my-zsh ..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo "export DOTFILES=$DIR" >> ~/.zshenv
echo "source \$DOTFILES/zsh/zshenv" >> ~/.zshenv
echo "source \$DOTFILES/zsh/zprofile" >> ~/.zprofile
echo "source \$DOTFILES/zsh/zlogin" >> ~/.zlogin
echo "source \$DOTFILES/zsh/zlogout" >> ~/.zlogout

mklink $DIR/zsh/zshrc ~/.zshrc
mklink $DIR/zsh/autoload $ZSH/autoload
