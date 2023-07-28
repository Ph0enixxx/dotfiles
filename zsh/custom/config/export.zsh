# export SYSTEM_VERSION_COMPAT=1
export ENABLE_CORRECTION="false"

# location of history
# export HISTFILE=~/.zhistory

# number of lines kept in history
export HISTCONTROL=ignoreboth,erasedups
export HISTSIZE=10000

# number of lines saved in the history after logout
export SAVEHIST=10000


# Compilation flags
export ARCHFLAGS="-arch arm64"

# Locale and Language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# NODE_PATH

# Color

# ls
export LSS_OPTIONS='--color=yes'

# less
export LESS='-eFRX'

# preferred tools
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER=less

# cheat
export CHEAT_COLORS=true
export CHEAT_COLORSCHEME=light

# LaTex
# echo $OSFONTDIR
export OSFONTDIR=/Library/Fonts:/Library/Fonts/Microsoft:~/Library/Fonts

# Flutter
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# ripgrep
export RIPGREP_CONFIG_PATH=~/.ripgreprc

# pyenv
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# zlib
# For compilers to find zlib you may need to set:
# brew install zlib bzip2
# export LDFLAGS="-L/usr/local/opt/bzip2/lib -L/usr/local/opt/zlib/lib"
# export CPPFLAGS="-I/usr/local/opt/bzip2/include -I/usr/local/opt/zlib/include"


# For pkg-config to find zlib you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

try_source $DOTFILES/zsh/custom/config/env/*.zsh

# add base path into $PATH
if [[ $Distribution == "Debian" ]] && ((! $path[(Ie)/usr/sbin]))  {
  prepend_path /usr/sbin
}

# homebrew
if [[ $System == 'Darwin' && -z $HOMEBREW_PREFIX ]] {
  eval "$(/opt/homebrew/bin/brew shellenv)"
}

