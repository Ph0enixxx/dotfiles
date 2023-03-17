#!/usr/bin/env bash

source ./utils.sh

if [[ $Distribution != "Debian" ]]; then
  echo "The current operating system is not Debian"
  exit 1
fi

# Install zsh & tmux
sudo apt-get install \
  sudo zsh \
  tmux tmux-plugin-manager

# Install tools
sudo apt-get install \
  bat bcache-tools \
  exa \
  fd-find fio fzf \
  hardinfo hdparm highlight htop \
  iotop \
  jnettop \
  lsb-release \
  man-db manpages-dev manpages-zh \
  nvme-cli \
  s-tui stress sysstat \
  toilet tldr \
  zip

# Install dev tools
sudo apt-get install \
  apache2-utils \
  podman

cd ~
curl -L -o archey.deb "https://github.com/HorlogeSkynet/archey4/releases/download/v4.14.1.0/archey4_4.14.1.0-1_all.deb"
sudo dpkg -i archey.deb
yes | rm archey.deb

curl -L -o lsd.deb "https://github.com/Peltoche/lsd/releases/download/0.23.1/lsd_0.23.1_amd64.deb"
sudo dpkg -i lsd.deb
yes | rm lsd.deb

curl -LO "https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb"
sudo dpkg -i nvim-linux64.deb
yes | rm nvim-linux64.deb

curl -L -o git-delta.deb "https://github.com/dandavison/delta/releases/download/0.15.1/git-delta_0.15.1_amd64.deb"
sudo dpkg -i git-delta.deb
yes | rm git-delta.deb

curl -L -o bottom.deb https://github.com/ClementTsang/bottom/releases/download/0.6.8/bottom_0.6.8_amd64.deb
sudo dpkg -i bottom.deb
yes | rm bottom.deb

# Install base runtimes
# Nodejs
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Python
curl https://pyenv.run | bash
