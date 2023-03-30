#!/usr/bin/env bash

source ./utils.sh

if [ $System != "Darwin" ]; then
  echo "The current operating system is not MacOS"
  return
fi

sudo xcode-select --install

if type brew &>/dev/null; then
  # Install Homebrew
  echo "Brew has been installed ..."
else
  echo "Start installing Brew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Tap
brew tap mongodb/brew
brew tap cjbassi/ytop
brew tap shopify/shopify

# Upgrade
brew upgrade

# Install Cask formulae
brew install --cask \
  baiduinput chromium devutils docker drawio firefox font-hack-nerd-font karabiner-elements mactex-no-gui macvim mongodb-compass multipass proxyman qbittorrent sqlitestudio thunder vimr

# Install formulae
brew install \
  ack archey \ 
  bat bat-extras \ 
  certbot cheat clang-format cmake cmake-docs composer ctags \ 
  deno diff-so-fancy docker \ 
  entr exa \
  fd fpp \ 
  gawk gh git-delta git-extras git-flow-avh git-lfs glances go \
  highlight htop httpd httpie hub \
  jnettop \
  kafka kubernetes-cli \
  lastpass-cli lazygit lsd luajit-openresty \
  mackup make maven mongodb/brew/mongodb-community mysql \
  navi neovim nginx nnn \
  openssl@3 \ 
  pandoc podman-compose prettier pyenv-virtualenv \
  reattach-to-user-namespace redis ripgrep \
  shadowenv shfmt shopify/shopify/shopify-cli smartmontools \
  tcpdump telnet texlive tmux tree \
  vimpager viu \
  w3m watchman wget \
  zsh

# FZF
# $(brew --prefix)/opt/fzf/install
