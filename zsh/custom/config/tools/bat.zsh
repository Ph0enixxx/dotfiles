##################################################
# bat/batcat                                     #
##################################################

export BAT_THEME="Solarized (dark)"

if [[ $System == 'Darwin' ]] {
  alias man='batman'
  alias bgrep='batgrep'
} elif [[ $System == 'Linux' ]] {
  if { command -v batcat &> /dev/null } {
    alias bat='batcat'
  }
}
