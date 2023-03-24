# Utilities

# function cd() {
  # builtin cd "$@"
  # fc -W
  # local HISTDIR="$HOME/.zsh_history$PWD"
  # if [ ! -d "$HISTDIR" ] ; then
    # mkdir -p "$HISTDIR"
  # fi
  # export HISTFILE="$HISTDIR/zhistory"
  # touch $HISTFILE

  # local ohistsize=$HISTSIZE
  # HISTSIZE=0
  # HISTSIZE=$ohistsize
  # fc -R
# }

# mkdir -p $HOME/.zsh_history$PWD
# export HISTFILE="$HOME/.zsh_history$PWD/zhistory"

# function allhistory {
  # cat $(find $HOME/.zsh_history -name zhistory)
# }

# function convhistory {
    # sort $1 |         #排序
    # uniq |         #合并相同行。
                    # #由于时间戳精确到秒，所以几乎不可能有相同的纪录
                    # #出现相同的纪录是因为 zsh 的处理方式，每次 cd 会在两个纪录文件中产生相同的 cd 命令
    # sed 's/^:\([ 0-9]*\):[0-9]*;\(.*\)/\1::::::\2/' |   #去掉历史纪录中不需要的字段。添加自定义的分隔符，方便下一步处理
    # awk -F"::::::" '{ $1=strftime("%Y-%m-%d %T",$1) "|"; print }'    # 将 UNIX 时间戳转换成可以看懂的格式
# }

# #使用 histall 命令查看全部历史纪录
# function histall {
  # convhistory =(allhistory) | sed '/^.\{20\} *cd/i\\'
# }  # 在每个 cd 命令前添加空行，判断工作目录比较容易
                               # # 可能会有一点不准确。因为启动和退出时不执行 cd 命令，没有相应的纪录。尤其是同时运行多个 zsh  的时候
# #使用 hist 查看当前目录历史纪录
# function hist {
  # convhistory $HISTFILE
# }

# #全部历史纪录 top20
# #统计单词出现的次数
# function top20 { allhistory | awk -F':[ 0-9]*:[0-9]*;' '{ $1="" ; print }' |
# sed 's/ /\n/g' |    # 根据空格拆分单词，可能不准确，比如 "\ " 之类的。但是以这类单词出现的频率，应该不会进入 top20
                    # # 本着我不会的就是不需要的原则，不作相应的处理了
# sed '/^$/d' | sort | uniq -c | sort -nr | head -n 20 }

function user-complete() {
  if [[ -n $BUFFER ]] ; then     # 如果该行有内容
    zle expand-or-complete    # 执行 TAB 原来的功能
  else                                  # 如果没有
    BUFFER="cd "                 # 填入 cd（空格）
    zle end-of-line                # 这时光标在行首，移动到行末
    zle expand-or-complete    # 执行 TAB 原来的功能
  fi
}

zle -N user-complete
bindkey "\t" user-complete

function bcd() {
  pwd | awk -v RS=/ '/\n/ {exit} {p=p $0 "/"; print p}' | tail -r | eval (__fzfcmd) +m --select-1 --exit-0 $FZF_BCD_OPTS | read -l result
  [ "$result" ]; and cd $result
  commandline -f repaint
}

function echopath() {
  local target
  target=$(echo $1 | eval $AWK_SPLIT_COLON | eval "fzf $FZF_OPTS_PREVIEW") || return
  cd $target
}

function join_string() {
  local str=$1
  local =${2:-" "}
}

# Debug = 0
# Info = 1
# Warn = 2
# Error = 3
export DEBUG_LEVEL=1
export DEBUG_SCOPE=""

#######################################
# print log message with level and scope
# Globals:
#   None
# Arguments:
#   $message {string} The text of log message
#   $level {enum} The level of log message: "debug" | "info" |"warn" | "error"
#   $scope {string} The scope of log message, which is a string used to help filtering and searching messages
# Outputs:
#   Write formatted message to stdout
# Usages:
#   log $message ($level = "info", $scope = "info")
#   log $level $message ($scope = $level)
#   log $level $scope $message
#######################################
function log() {
  local -A LEVEL_COLOR=(
    debug $fg_bold[white]
    info $fg_bold[blue]
    warn $fg_bold[magenta]
    error $fg_bold[red]
  )
  local -A MESSAGE_COLOR=(
    debug $fg[default]
    info $fg_bold[white]
    warn $fg_bold[yellow]
    error $fg_bold[red]
  )

  if (( $# ==1 )); then
    local level="info"
    local scope=$level
    local message=$(echo $1 | awk '$0')
  elif (( $# == 2 )); then
    local level=$1
    local scope=$level
    local message=$(echo $2 | awk '$0')
  elif (( $# == 3 )); then
    local level=$1
    local scope=$2
    local message=$(echo $3 | awk '$0')
  fi

  if (( $+message )); then
    local time=$(date +"%T")
    IFS=$'\n' local lines=(${=message})
    for line ($lines) {
      if [[ $level == 'error' ]]; then
        printf "[ %s ] [ %-$((5+$#LEVEL_COLOR[${level:l}]+$#reset_color))s ] %s%s\n" $fg[green]$time$reset_color $LEVEL_COLOR[${level:l}]${level:u}$reset_color $fg_bold[cyan]$scope:$reset_color $MESSAGE_COLOR[${level:l}]" $line"$reset_color >&2
      else
        printf "[ %s ] [ %-$((5+$#LEVEL_COLOR[${level:l}]+$#reset_color))s ] %s%s\n" $fg[green]$time$reset_color $LEVEL_COLOR[${level:l}]${level:u}$reset_color $fg_bold[cyan]$scope:$reset_color $MESSAGE_COLOR[${level:l}]" $line"$reset_color
      fi
    }
  fi
}

function _log_init() {
  local level_priority=$1
  local level=$2
  eval "
    function $level() {
      if (( \$+DEBUG_LEVEL && \$DEBUG_LEVEL <= $level_priority )); then
        local level=$level
        if (( \$# == 1 )); then
          local scope=\$level
          local message=\$1
        elif (( \$# == 2 )); then
          local scope=\$1
          local message=\$2
        fi
        if [[ \"\$DEBUG_SCOPE\" == \"\" || \$DEBUG_SCOPE == \$scope ]]; then
          log \$level \$scope \$message
        fi
      fi
    }"
}

#######################################
# print debug message with scope
# Globals:
#   DEBUG_LEVEL debug level
#   DEBUG_SCOPE debug scope
# Arguments:
#   $message {string} The text of log message
#   $scope {string} The scope of log message, which is a string used to help filtering and searching messages
# Outputs:
#   Write formatted message to stdout
# Usages:
#   debug $message ($scope = "debug")
#   debug $scope $message
#######################################
_log_init 0 debug

#######################################
# print info message with scope
# Globals:
#   DEBUG_LEVEL debug level
#   DEBUG_SCOPE debug scope
# Arguments:
#   $message {string} The text of log message
#   $scope {string} The scope of log message, which is a string used to help filtering and searching messages
# Outputs:
#   Write formatted message to stdout
# Usages:
#   info $message ($scope = "info")
#   info $scope $message
#######################################
_log_init 1 info

#######################################
# print warn message with scope
# Globals:
#   DEBUG_LEVEL debug level
#   DEBUG_SCOPE debug scope
# Arguments:
#   $message {string} The text of log message
#   $scope {string} The scope of log message, which is a string used to help filtering and searching messages
# Outputs:
#   Write formatted message to stdout
# Usages:
#   info $message ($scope = "warn")
#   info $scope $message
#######################################
_log_init 2 warn

#######################################
# print error message with scope
# Globals:
#   DEBUG_LEVEL debug level
#   DEBUG_SCOPE debug scope
# Arguments:
#   $message {string} The text of log message
#   $scope {string} The scope of log message, which is a string used to help filtering and searching messages
# Outputs:
#   Write formatted message to stderr
# Usages:
#   error $message ($scope = "error")
#   error $scope $message
#######################################
_log_init 3 error

#######################################
# make a soft symlink; if the file with same name of symlink exists, try to rename the existed file with a backup name
# Globals:
#   None
# Arguments:
#   $message {string} The text of log message
#   $scope {string} The scope of log message, which is a string used to help filtering and searching messages
# Outputs:
#   Create a symlink
# Usages:
#   mklink $source $target
#######################################
function mklink() {
  if [[ -e $1 ]] {
    if [[ -e $2 ]] {
      local bkp_file=$2_bkp
      warn 'Existed file/directory:' $2 'has been rename to' $bkp_file
      mv $2 $bkp_file
    }
    ln -s $1 $2
  }
}

function detect_platform() {
  local platform
  platform="$(uname -s | tr '[:upper:]' '[:lower:]')"

  case "${platform}" in
    linux) platform="linux" ;;
    darwin) platform="macos" ;;
    windows) platform="win" ;;
  esac

  printf '%s' "${platform}"
}

function detect_shell() {
  local shell
  if (($+ZSH_VERSION)) {
    shell="zsh"
  } elif (($+BASH_VERISON)) {
    shell="bash"
  }

  printf '%s' $shell
}

function get_file_status() {
  if [ -r $1 ]; then
    echo "$fg_bold[green]﫠$reset_color"
  else
    echo "$fg_bold[red] $reset_color"
  fi
}

function get_os_type() {
  local os=${System:l}
  if [ $System = 'Linux' ]; then
    os=${Distribution:l}
  fi
  echo $os
}

# alias.zsh => alias.darwin.zsh
# alias => alias.darwin
function get_os_file() {
  local os=$(get_os_type)
  local file=$1
  if [[ -z ${file:e} ]]; then
    echo "${file:r}.$os"
  else
    echo "${file:r}.$os.${file:e}"
  fi
}

function try_source() {
  local f
  local os_file
  for f in "$@"; do
    debug "== Try source file =="
    if [[ ${f:t:r:r} == ${f:t:r} || -z ${f:t:r:r}  ]]; then
      os_file=$(get_os_file $f)
      file_status=$(get_file_status $f)
      debug "   $file_status $f"
      file_status=$(get_file_status $os_file)
      debug "   $file_status $os_file"

      [ -r $f ] && . $f
      [ -r $os_file ] && . $os_file
    else
      debug "   $fg_bold[red] $reset_color $f - $fg[red]os-specified script, IGNORE it!$reset_color"
    fi
  done
}

function try_hash_directory() {
  # if [[  ]]
  echo $#
}

function try_exec() {
  if [[ -f $1 ]] {
    . $1
  } else {
    debug "Execute" "try_exec"

  }
}

function server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  http-server
}

# function gi() {
  # curl -L -s https://www.gitignore.io/api/$@
# }
#
# function gig() {
  # gi $@ >> .gitignore
# }

# function gh() {
  # git clone git@github.com:$@.git
  # typeset -a buffer
  # buffer=$@
  # buffer=(${=buffer//\// })
  # echo -n "[user]\n  name = Phoenix Tsui\n  email = xusiyuan841028@gmail.com" >> "${buffer[2]}/.git/config"
# }

function omzp() {
  echo $#
  if $# == 0
  then
    echo 'return'
    return
  fi
  typeset -a buffer
  buffer=$@
  buffer=(${=buffer//\// })
  git clone git@github.com:$@.git $ZSH_CUSTOM/plugins/$buffer
  echo "ZSH plugin $@ has been installed in to $ZSH_CUSTOM/plugins/$buffer"
}

function gstats() {
  git log --format='%aN' | sort -u | while read name; do echo -en "$name\t"; git log --author="$name" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -; done
}

# Nodejs
function enable_node_pkg_manager() {
  local manager=${NVM_PKG_MANAGER:-pnpm}
  local version=$(npm show $manager version)
  if { ! command -v $manager &> /dev/null } {
    if { command -v corepack &> /dev/null } {
      corepack enable
      corepack prepare $manager@$version --activate
    } else {
      npm install -g $manager
    }
    if [[ $manager == "pnpm" ]] {
      pnpm setup
      pnpm install-completion zsh
    }
  }
}

function ls_large() {
  local file
  local message
  local filtered 
  for file in `lso . | tr " " "\?"`; do
    file=`tr "\?" " " <<<$file`
    message=`du -hs "./$file"`
    filtered=`awk '/^[0-9. ]+G/' <<<$message`
    if [[ $filtered != "" ]]; then
      echo "$fg_bold[red]$filtered$reset_color"
    else
      filtered=`awk '/^[ ]*[0-9]{3}\.*[0-9]*M/' <<<$message`
      if [[ $filtered != "" ]]; then
        echo "$fg_bold[yellow]$filtered$reset_color"
      fi
    fi
  done
  echo
  echo "$fg_bold[blue]Total: $(du -hs .)$reset_color"
}

#######################################
# list all network ports with status 
# Globals:
# Arguments:
#   $status {string} The text of log message
# Outputs:
#   Open a fzf with filtered ports
# Usages:
#   port ($status = "LISTEN")
#   port ESTABLISHED
#######################################
function port() {
  local ipOpts
  local stateOpts
  local protocolOpts
  local portOpts
  local arg_filename=(myfile)  # set a default
  local help

  zmodload zsh/zutil
  zparseopts -D -F -K -- \
    {h,-help}=help \
    -ip:=ipOpts \
    -state:=stateOpts \
    -protocol:=protocolOpts \
    -port:=portOpts \
    {v,-ip-ver}:=ipVersionOpts \
    {f,-filename}:=arg_filename || return 1

  local usage=(
    "port [-h|--help]"
    "port [--ip-ver 4|6] [--ip <ip>] [--protocol <protocol>[ --state <state>]] [--port <port>] [<query-string>]"
  )

  [[ -z "$help" ]] || { print -l $usage && return }

  local ip=$ipOpts[-1]
  local state=$stateOpts[-1]
  local protocol=$protocolOpts[-1]
  local port=$portOpts[-1]
  local ipVersion=$ipVersionOpts[-1]

  debug "port" "ip: $ip state: $state protocol: $protocol port: $port ipVersion: $ipVersion"

  if [[ $ipVersion != "4" ]]&&[[ $ipVersion != "6" ]]&&[[ -n $ipVersion ]]; then
    echo "IP version should be 4(IPv4) or 6(IPv6)!"
  fi

  local s=${1}

  local sOpts
  if [[ -n $state ]]; then
    if [[ -z $protocol ]]; then
      echo "Please specify both state and protocol!"
      return
    else
      sOpts="-s $protocol:$state"
    fi
  fi

  local iOpts="-i $ipVersion"
  if [[ -n protocol ]]; then
    iOpts+="$protocol"
  fi
  if [[ -n $ip ]]; then
    iOpts+="@$ip"
  fi
  if [[ -n $port ]]; then
    iOpts+=":$port"
  fi

  local cmd="lsof -Pn ${=iOpts} ${=sOpts} 2> /dev/null"

  if [[ $System == 'Linux' ]]; then
    cmd="sudo $cmd"
  fi
  eval $cmd | fzf --query=$s --header-lines=1 --height=100%
}

# vim:ft=zsh:
