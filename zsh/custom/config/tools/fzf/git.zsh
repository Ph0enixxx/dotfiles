# COMMANDS
# zgc - checkout git branch/tag, with a preview showing the commits between the tag/branch and HEAD

FZF_GIT_OPTIONS="--height 100% --ansi"
FZF_GIT_LOG_FORMAT="format:'%C(yellow)%h%Cred%d %Creset%s %Cgreen(%ai) %C(bold blue)[%an]'"

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

# alias glNoGraph='git log --graph --color=always --format="%C(auto)%h%C(auto)%d %Creset%s %Cred(%cr)%C(bold blue)[%an]" "$@"'
# alias glNoGraph='git graph'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
# _viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | delta --features line-numbers decorations'"

export FZF_GIT_OPTIONS="--reverse --no-multi --ansi --height=100%"

# zgb - [G]it Checkout [B]ranch with previews
# format:'%C(yellow)%h%Cred%d %Creset%s %Cgreen(%ai) %C(bold blue)[%an]'
zgb() {
  is_in_git_repo || return
  local tags branches target
  branches=$(git --no-pager branch --all --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" | sed '/^$/d') || return
  target=$(echo "$branches" | fzf --height 100% --no-hscroll --no-multi -n 2 --ansi --preview="git --no-pager log -150 --pretty=$FZF_GIT_LOG_FORMAT '..{2}'") || return
  echo $(awk '{print $2}' <<<"$target" )
  git checkout $(awk '{print $2}' <<<"$target" )
}

# zgb - [G]it Checkout [T]ag with previews
zgt() {
  is_in_git_repo || return
  local tags branches target
  tags=$(git --no-pager tag --sort=-v:refname | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(echo "$tags" | fzf --height 100% --no-hscroll --no-multi -n 2 --ansi --preview="git --no-pager log -150 --pretty=$FZF_GIT_LOG_FORMAT '..{2}'") || return
  git checkout $(awk '{print $2}' <<<"$target" )
}


# zgcc - [G]it Checkout [C]ommit with previews
zgc() {
  is_in_git_repo || return
  local target
  target=$(git graph | fzf ${=FZF_GIT_OPTIONS} --no-sort --tiebreak=index --preview=$_viewGitLogLine ) || return
  git checkout $(awk '{print $2}' <<<"$target" )
}

# zgls - [G]it Commit browser with previews
zgls() {
  is_in_git_repo || return
  git graph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
      --ansi --preview="$_viewGitLogLine" \
      --header "[Enter] to view, [Alt-Y] to copy hash" \
      --bind "enter:execute:$_viewGitLogLine   | less -R" \
      --bind "alt-y:execute:$_gitLogLineToHash | pbcopy"
}


# zgst - pick files from `git status -s`
zgst() {
  is_in_git_repo || return
  local files
  files=$(git status -s | FZF_DEFAULT_OPTS="$FZF_GIT_OPTIONS -n 2 --preview='git diff -- {2}'" fzf -m "$@") || return
  files=$(echo $files | awk '{print $2}')
  git add ${(f)files}
}

# zgi - [G]it [I]gnorefile
zgi() {
  if  [ "$#" -eq 0 ]; then
    IFS+=","
    for item in $(__gi list); do
      echo $item
    done | fzf --multi --ansi --preview="curl -L -s https://www.gitignore.io/api/{}" | paste -s -d " " - |
      { read result && gi "$result"; }
  else
    gi "$@"
  fi
}

# Complete
# _fzf_complete_git() {
    # ARGS="$@"
    # local branches
    # branches=$(git branch -vv --all)
    # if [[ $ARGS == 'git co'* ]]; then
        # _fzf_complete --reverse --multi -- "$@" < <(
            # echo $branches
        # )
    # else
        # eval "zle ${fzf_default_completion:-expand-or-complete}"
    # fi
# }
#
# _fzf_complete_git_post() {
    # awk '{print $1}'
# }

