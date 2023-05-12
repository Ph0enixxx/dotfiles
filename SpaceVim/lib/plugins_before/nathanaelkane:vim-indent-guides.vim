" if !exists('g:loaded_indent_guides') && !&cp
  " finish
" endif

let s:logger = api#logger#create('config')
call s:logger.info('load logger')
" call s:logger.debug('plugin exist? '.api#utils#exist_plugin('nathanaelkane/vim-indent-guides'))
" call s:logger.debug('plugin loaded? '.exists('g:loaded_indent_guides'))

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 20
let g:indent_guides_indent_levels = 20

let g:indent_guides_exclude_filetypes = [
      \ 'calendar', 'coc-explorer', 'coc_todolist',
      \ 'floaterm', 'fzf',
      \ 'help',
      \ 'nerdtree', 
      \ 'startify', 
      \ 'vimfiler', 'vista',
      \ ]

" SignColumn     xxx ctermfg=12 ctermbg=0 guifg=#839496
" FoldColumn     xxx ctermfg=12 ctermbg=0 guifg=#839496 guibg=#073642
"
" SignColumn     xxx ctermfg=14 ctermbg=242 guifg=#839496
" FoldColumn     xxx ctermfg=14 ctermbg=242 guifg=#839496 guibg=#073642
