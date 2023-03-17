##################################################
# bat/batcat                                     #
##################################################

export BAT_THEME="Solarized (dark)"

if [[ $System == 'Darwin' ]] {
  alias man='batman'
  alias bgrep='batgrep'
} elif [[ $System == 'Linux' ]] {
  alias bat='batcat'
}
