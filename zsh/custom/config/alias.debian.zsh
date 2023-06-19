##################################################
# Command                                        #
##################################################
#
if [[ $Distribution != 'Debian' ]]; then
  return
fi

# fd
alias fd='fdfind'

alias test-hd='sudo hpparm -tT --direct'

if command -v docker &>/dev/null; then
  alias docker='sudo docker'
fi

if command -v podman &>/dev/null; then
  alias podman='sudo podman'
fi
