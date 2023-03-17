set laststatus=2
set noshowmode
set linespace=2

let g:airline_powerline_fonts                    = 1
let g:airline_detect_modified                    = 1

let g:airline_theme                              = 'dark'
let g:airline_solarized_bg                       = 'dark'

let g:airline_highlighting_cache                 = 1

" Extensions
let g:airline#extensions#searchcount#enabled     = 0

let g:airline#extensions#tabline#enabled         = 1
let g:airline#extensions#tabline#show_buffers    = 1
let g:airline#extensions#tabline#show_tabs       = 1
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#tab_nr_type     = 1
let g:airline#extensions#tabline#show_tab_nr     = 1

let g:airline#extensions#quickfix#quickfix_text  = 'Quickfix'
let g:airline#extensions#quickfix#location_text  = 'Location'

"let g:airline#extensions#bufferline#enabled      = 1
"
let g:airline#extensions#bookmark#enabled        = 0

let g:airline#extensions#branch#enabled          = 1
let g:airline#extensions#branch#empty_message    = ''
" TODO: customize branch name
let g:airline#extensions#branch#format           = 1

let g:airline#extensions#csv#enabled             = 1
let g:airline#extensions#csv#column_display      = 'Name'

let g:airline#extensions#eclim#enabled           = 0

let g:airline#extensions#syntastic#enabled       = 0

let g:airline#extensions#tagbar#enabled          = 0

let g:airline#extensions#csv#enabled             = 1

let g:airline#extensions#wordcount#enabled       = 1

let g:airline#extensions#whitespace#enabled      = 0

let g:airline#extensions#ycm#enabled             = 0

let g:airline#extensions#virtualenv#enabled      = 1
let g:airline#extensions#keymap#enabled          = 1
let g:airline#extensions#fugitiveline#enabled    = 1

let g:airline#extensions#ale#enabled             = 0
"let g:airline#extensions#ale#error_symbol        = 'E:'
"let g:airline#extensions#ale#warning_symbol      = 'W:'

let g:airline#extensions#nvim_typescript#enabled = 0

let g:airline#extensions#coc#enabled             = 1
let g:airline#extensions#coc#error_symbol          = ' '
let g:airline#extensions#coc#warning_symbol        = ' '
" let airline#extensions#coc#stl_format_err        = '%E{[%e(#%fe)]}'
" let airline#extensions#coc#stl_format_warn       = '%W{[%w(#%fw)]}'
