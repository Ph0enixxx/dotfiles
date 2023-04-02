#!/usr/bin/env bash

source ./utils.sh

if [[ $Distribution != "Debian" ]]; then
  echo "The current operating system is not Debian"
  exit 1
fi

# minimium installation
apt-get install \
  zsh git build-essential \
  curl \
  exa \
  fd-find fzf \
  highlight htop \
  lsb-release \
  man-db manpages-dev manpages-zh \
  zip


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

# Install github cli (gh)
echo "Install github cli (gh) ..."
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

function get_github_latest_release() {
  repo=$1
  eval "gh api repos/${repo}/releases --template '{{range .}}{{.tag_name}}{{\"\\n\"}}{{end}}' | awk 'BEGIN { latest=\"\" } { if (latest==\"\" && \$0 != \"nightly\") latest=\$0; } END { print latest }'"
}

function remove_v() {
  local AWK_REMOVE_V_CHAR="awk '{ sub(/^v/, \"\"); print \$0 }'"
  echo $1 | eval $AWK_REMOVE_V_CHAR
}

gh auth login

cd ~
latest_version=`get_github_latest_release "HorlogeSkynet/archey4"`
curl -L -o archey.deb "https://github.com/HorlogeSkynet/archey4/releases/download/${latest_version}/archey4_$(remove_v $latest_version)-1_all.deb"
sudo dpkg -i archey.deb
yes | rm archey.deb

latest_version=`get_github_latest_release "lsd-rs/lsd"`
+curl -L -o lsd.deb "https://github.com/lsd-rs/lsd/releases/download/${latest_version}/lsd_${latest_version}_amd64.deb"
sudo dpkg -i lsd.deb
yes | rm lsd.deb

latest_version=`get_github_latest_release "sharkdp/bat"`
curl -L -o bat.deb "https://github.com/sharkdp/bat/releases/download/${latest_version}/bat_$(remove_v $latest_version).deb"
sudo dpkg -i bat.deb
yes | rm bat.deb

latest_version=`get_github_latest_release "neovim/neovim"`
curl -L -o nvim.deb "https://github.com/neovim/neovim/releases/download/${latest_version}/nvim-linux64.deb"
sudo dpkg -i nvim.deb
yes | rm nvim.deb

latest_version=`get_github_latest_release "dandavison/delta"`
curl -L -o git-delta.deb "https://github.com/dandavison/delta/releases/download/${latest_version}/git-delta_${latest_version}.deb"
sudo dpkg -i git-delta.deb
yes | rm git-delta.deb

latest_version=`get_github_latest_release "ClementTsang/bottom"`
curl -L -o bottom.deb "https://github.com/ClementTsang/bottom/releases/download/${latest_version}/bottom_${latest_version}_amd64.deb"
sudo dpkg -i bottom.deb
yes | rm bottom.deb

mkdir $HOME/bin
latest_version=`get_github_latest_release "junegunn/fzf"`
curl -L -o fzf.tar.gz "https://github.com/junegunn/fzf/releases/download/${latest_version}/fzf-${latest_version}-linux_amd64.tar.gz" && tar -x -f fzf.tar.gz
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
