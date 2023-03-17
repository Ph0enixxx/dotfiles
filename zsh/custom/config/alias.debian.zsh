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
