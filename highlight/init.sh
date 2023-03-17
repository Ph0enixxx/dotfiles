#!/usr/bin/env bash

source ../utils.sh

# link config files
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mklink $DIR/../highlight ~/.highlight
