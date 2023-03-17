let g:choosewin_overlay_enable = 1
let g:choosewin_color_overlay = {
      \ 'gui': ['DodgerBlue3', 'DodgerBlue3'],
      \ 'cterm': [25, 25]
      \ }
let g:choosewin_color_overlay_current = {
      \ 'gui': ['firebrick1', 'firebrick1'],
      \ 'cterm': [124, 124]
      \ }

call api#keymap#map_normal_commands('-', ':ChooseWin<CR>', { 'normal': 0, 'nore': 0 })
