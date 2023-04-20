let g:floaterm_width = 0.9
let g:floaterm_height = 0.9

let g:floaterm_keymap_toggle = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_new    = '<F10>'

augroup floaterm
  autocmd!
  autocmd FileType floaterm call api#utils#use_tool_panel_appearance()
augroup END

