set laststatus=2
set noshowmode
set linespace=2

let g:airline_powerline_fonts                    = 1
let g:airline_detect_modified                    = 1
let g:airline_detect_paste                       = 1
let g:airline_detect_spell                       = 1
let g:airline_detect_spelllang                   = 1
let g:airline_detect_iminsert                    = 1

let g:airline_theme                              = 'dark'
let g:airline_solarized_bg                       = 'dark'

" let g:airline_theme_patch_func                   = 'AirlineThemePatch'
" function! AirlineThemePatch(palette)
  " if g:airline_theme == 'badwolf'
    " for colors in values(a:palette.inactive)
      " let colors[3] = 245
    " endfor
  " endif
" endfunction
let g:airline_filetype_overrides = {
      \ 'coc-explorer':  [ 'CoC Explorer', '' ],
      \ 'defx':  ['defx', '%{b:defx.paths[0]}'],
      \ 'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
      \ 'floggraph':  [ 'Flog', '%{get(b:, "flog_status_summary", "")}' ],
      \ 'gundo': [ 'Gundo', '' ],
      \ 'help':  [ 'Help', '%f' ],
      \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
      \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
      \ 'startify': [ 'startify', '' ],
      \ 'vim-plug': [ 'Plugins', '' ],
      \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
      \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
      \ 'vaffle' : [ 'Vaffle', '%{b:vaffle.dir' ],
      \ }

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

let g:airline#extensions#nvim_typescript#enabled = 1

let g:airline#extensions#coc#enabled             = 1
let g:airline#extensions#coc#error_symbol          = ' '
let g:airline#extensions#coc#warning_symbol        = ' '
" let airline#extensions#coc#stl_format_err        = '%E{[%e(#%fe)]}'
" let airline#extensions#coc#stl_format_warn       = '%W{[%w(#%fw)]}'
let g:airline#extensions#coc#show_coc_status = 1
let g:airline#extensions#coc#stl_format_err = '%C(L%L)'
let g:airline#extensions#coc#stl_format_warn = '%C(L%L)'

let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#vista#enabled = 1

let g:airline#extensions#searchcount#enabled = 1
let g:airline#extensions#searchcount#show_search_term = 1
let g:airline#extensions#searchcount#search_term_limit = 8

let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes = ['asciidoc', 'help', 'mail', 'markdown', 'rmd', 'nroff', 'org', 'plaintex', 'rst', 'tex', 'text']

" if !exists('g:airline_symbols')
  " let g:airline_symbols = {}
" endif
"
" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.colnr = ' ㏇:'
" let g:airline_symbols.colnr = ' ℅:'
" let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.linenr = ' ␊:'
" let g:airline_symbols.linenr = ' ␤:'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.maxlinenr = '㏑'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.spell = 'Ꞩ'
" let g:airline_symbols.notexists = 'Ɇ'
" let g:airline_symbols.notexists = '∄'
" let g:airline_symbols.whitespace = 'Ξ'
"
" powerline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.colnr = ' ℅:'
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ' :'
" let g:airline_symbols.maxlinenr = '☰ '
" let g:airline_symbols.dirty='⚡'
