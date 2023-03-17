"=============================================================================
" config.vim --- config file layer
" Author: Phoenix Tsui < xusiyuan841028@gmail.com >
" License: MIT
"=============================================================================

function! SpaceVim#layers#lang#actionscript#plugins() abort
  let plugins = []
  call add(plugins, ['wsdjeg/vim-actionscript', {'merged' : 0}])
  return plugins
endfunction

