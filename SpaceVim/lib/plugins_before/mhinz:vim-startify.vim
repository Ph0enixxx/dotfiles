scriptencoding utf-8

" Keymap
let s:map_options = { 'nore': 0, 'buffer': 1, 'normal': 0 }
augroup startify
  autocmd!
  autocmd User Startified setlocal cursorline
  autocmd User Startified setlocal buftype=
  autocmd User Startified call api#keymap#map_normal_commands('o', '<plug>(startify-open-buffers)', s:map_options)

augroup END

" Keymap
call api#keymap#map_normal_commands('<F6>', ':Startify<cr>')

let g:startify_files_number = 15
" let g:startify_custom_header = [
      "| \'' |
      " \'',
      " \'           ██████╗ ██╗  ██╗ ██████╗ ███████╗███╗   ██╗██╗██╗  ██╗    ██╗  ██╗██╗   ██╗         ',
      " \'           ██╔══██╗██║  ██║██╔═══██╗██╔════╝████╗  ██║██║╚██╗██╔╝    ╚██╗██╔╝██║   ██║         ',
      " \'           ██████╔╝███████║██║   ██║█████╗  ██╔██╗ ██║██║ ╚███╔╝      ╚███╔╝ ██║   ██║         ',
      " \'           ██╔═══╝ ██╔══██║██║   ██║██╔══╝  ██║╚██╗██║██║ ██╔██╗      ██╔██╗ ██║   ██║         ',
      " \'           ██║     ██║  ██║╚██████╔╝███████╗██║ ╚████║██║██╔╝ ██╗    ██╔╝ ██╗╚██████╔╝         ',
      " \'           ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝ ╚═════╝          ',
      " \'',
      " \''
      " \]

let g:startify_bookmarks = [
      \ {'s': '~/.SpaceVim.d/init.toml'},
      \ {'c': '~/.SpaceVim.d/coc-settings.json'},
      \ ]

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']           },
      \ { 'type': 'dir',       'header': ['   MRU '.getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']      },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']     },
      \ { 'type': 'commands',  'header': ['   Commands']      },
      \ ]

let g:startify_commands = [
      \ {'h': ['Vim Reference', 'h ref']},
      \ {'m': ['My magical function', 'call Magic()']},
      \ ]
