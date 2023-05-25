export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
if [[ $USE_MIRROR == 1 ]] {
  export NVM_NODEJS_ORG_MIRROR=https://mirrors.ustc.edu.cn/node/
}
