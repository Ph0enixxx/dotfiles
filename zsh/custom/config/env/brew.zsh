if ! command -v brew &> /dev/null; then
  return
fi

if [[ $USE_MIRROR == 1 ]] {
  export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
  export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
  export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
  export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
}

if [[ $System == 'Darwin' ]] {
  if [[ -z $(id $USER | grep '(admin)') ]] {
    export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
  }
}

if { command -v bat &> /dev/null } {
  export HOMEBREW_BAT=1
}

export HOMEBREW_COLOR=1
