"=============================================================================
" edit.vim --- edit utility layer 
" Author: Phoenix Tsui < xusiyuan841028@gmail.com >
" License: MIT
"=============================================================================

function! SpaceVim#layers#autocomplete#plugins() abort
  "return a list of plugins used in this plugins.
  let plugins = []
  call add(plugins, ['wsdjeg/vim-actionscript', {'merged' : 0}])
  return plugins
endfunction

function! SpaceVim#layers#autocomplete#config() abort
  "return a list of plugins used in this plugins.
endfunction

function! SpaceVim#layers#autocomplete#set_variable() abort
  "function for setting layer options.
endfunction
