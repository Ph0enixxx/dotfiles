#!/usr/bin/env bash

source ./utils.sh

if [[ $Distribution != "Debian" ]]; then
  echo "The current operating system is not Debian"
  exit 1
fi

# Install zsh & tmux
apt-get install \
  sudo zsh git build-essential \
  tmux tmux-plugin-manager

# Install tools
apt-get install \
  bcache-tools  \
  curl \
  exa \
  f2fs-tools fd-find fio fzf \
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
  python3-venv python3-pip \
  podman

function get_github_latest_release() {
  repo=$1
  eval "gh api repos/${repo}/releases --template '{{range .}}{{.tag_name}}{{\"\\n\"}}{{end}}' | awk '{ if (NR == 1) print \$0 }'"
}

cd ~
latest_version=`get_github_latest_release "HorlogeSkynet/archey4"`
curl -L -o archey.deb "https://github.com/HorlogeSkynet/archey4/releases/download/v4.14.1.0/archey4_4.14.1.0-1_all.deb"
sudo dpkg -i archey.deb
yes | rm archey.deb

curl -L -o lsd.deb "https://github.com/Peltoche/lsd/releases/download/0.23.1/lsd_0.23.1_amd64.deb"
sudo dpkg -i lsd.deb
yes | rm lsd.deb

curl -L -o bat.deb "https://github.com/sharkdp/bat/releases/download/v0.23.0/bat-musl_0.23.0_amd64.deb"
sudo dpkg -i bat.deb
yes | rm bat.deb

curl -L -o nvim.deb "https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb"
sudo dpkg -i nvim.deb
yes | rm nvim.deb

curl -L -o git-delta.deb "https://github.com/dandavison/delta/releases/download/0.15.1/git-delta_0.15.1_amd64.deb"
sudo dpkg -i git-delta.deb
yes | rm git-delta.deb

curl -L -o bottom.deb https://github.com/ClementTsang/bottom/releases/download/0.6.8/bottom_0.6.8_amd64.deb
sudo dpkg -i bottom.deb
yes | rm bottom.deb

mkdir $HOME/bin
curl -L -o fzf.tar.gz "https://github.com/junegunn/fzf/releases/download/0.38.0/fzf-0.38.0-linux_amd64.tar.gz" && tar -x -f fzf.tar.gz
mv fzf bin/
yes | rm fzf.tar.gz

# Python
curl https://pyenv.run | bash

# Github client
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
