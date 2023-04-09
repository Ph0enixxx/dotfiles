##################################################
# bat/batcat                                     #
##################################################


if [[ $System == 'Darwin' ]] {
  alias man='batman'
  alias bgrep='batgrep'
} elif [[ $System == 'Linux' ]] {
  if { command -v batcat &> /dev/null } {
    alias bat='batcat'
  }
}
