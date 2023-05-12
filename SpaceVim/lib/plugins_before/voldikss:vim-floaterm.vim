let g:floaterm_width = 0.9
let g:floaterm_height = 0.9

let g:floaterm_keymap_toggle = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_new    = '<F10>'
" let g:floaterm_borderchars   = '═║═║╔╗╝╚'
let g:floaterm_borderchars   = '━┃━┃┏┓┛┗'


let s:map_options = { 'buffer': 1 }

augroup floaterm
  autocmd!
  autocmd FileType floaterm call api#utils#use_tool_panel_appearance()
  autocmd FileType floaterm call api#keymap#map_terminal_commands([['zz', '<c-\><c-n>']], s:map_options)
    " execute printf('nnoremap <silent> %s :%s<CR>', a:mapvar, a:command)
    " execute printf('tnoremap <silent> %s <C-\><C-n>:%s<CR>', a:mapvar, a:command)
augroup END

