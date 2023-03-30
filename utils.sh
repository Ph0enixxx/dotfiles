#!/usr/bin/env bash

if command -v mklink &> /dev/null; then
  return
fi

function mklink() {
  if [ -f $1 ] || [ -d $1 ]; then
    if [ -f $2 ] || [ -d $2 ]; then
      # bkp_file=$2_$(date +%Y%m%d%H%M%S)
      bkp_file=$2_bkp
      echo 'Existed file/directory:' $2 'has been moved to' $bkp_file
      mv $2 $bkp_file
    fi
    ln -s $1 $2
  fi
}

function try_exec() {
  if [ -f $1 ]; then
    . $1
  fi
}

function get_github_latest_release() {
  repo=$1
  eval "gh api repos/${repo}/releases --template '{{range .}}{{.tag_name}}{{\"\\n\"}}{{end}}' | awk '{ if (NR == 1) print \$0 }'"
}

# Global Variables
System="$(uname -s)"
Distribution=Unknown

if [[ $System = "Linux" ]]; then
  Distribution="$(lsb_release -i | awk '{print $3}')"
fi
