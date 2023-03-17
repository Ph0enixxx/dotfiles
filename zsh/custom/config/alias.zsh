##################################################
# Command                                        #
##################################################

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias grep='grep --color=auto'
alias tree='exa --tree --all --color=always --group-directories-first -I "node_modules|.git|.DS_Store"'

# exit
alias q='exit'

# Utilize FZF
alias lspath='echo $PATH | eval $AWK_SPLIT_COLON | fzf'

# ls
# alias ls='ls -FG'
# alias ll='ls -l'
alias ls='lsd -F'
alias l='ls'
alias l1='ls -e'
alias ld='ls -d'
alias ll='ls -Al'
alias lS='ls -AlS'
alias la='ls -A'
alias lla='ls -Al'
alias lt='ls --tree'

# Vim
alias ss='source ~/.zshrc'
alias ee='vi ~/.zshrc'
alias vi='nvim'
alias vim='nvim'

# Systee Status
alias port='lsof -Pni4 | grep LISTEN'

# Git
alias g='git'
alias lgit='lazygit'
alias gf='git flow'
alias gff='git flow feature'
alias stash='git stash'
alias push='git push'
alias pull='git pull'
alias gmm='git pull origin master'

# gitignore
alias gigl='gig angular,dart,flutter,git,go,homebrew,intellij+all,java,jenv,jetbrains+all,linux,macos,maven,node,nuxtjs,nwjs,sass,ssh,sublimetext,tags,vim,visualstudiocode,vuejs,windows,yarn,zsh'

# Node.js
alias nh='node --harmony'
alias n='nvm'
alias y='yarn'
alias cnpm="npm --registry=https://registry.npmmirror.com \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npmmirror.com/dist \
--userconfig=$HOME/.cnpmrc"

# Helper
# alias update='brew update & brew upgrade & sudo npm update -g'

# Docker
alias dk='docker'

# alias fh='print -z $(([ -n "$ZSH_NAME" ] && fc -l 1 || history) |
    # fzf +s --tac --preview "print {} | sed -E '\''s/ *[0-9]*\*? *//'\''" --preview-window=up:2:wrap |
    # sed -E "s/ *[0-9]*\*? *//")'

alias set_emsdk='try_source ~/emsdk/emsdk_env.sh'

alias lock="osascript -e 'tell application \"System Events\" to keystroke \"q\" using {command down,control down}'"

# SSH
alias sshnas='ssh nas'
alias sshdocker='ssh docker'
