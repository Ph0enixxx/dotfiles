let g:tsuquyomi_disable_quickfix = 1
" let g:tsuquyomi_completion_detail = 1

" set ballooneval
" autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()

let s:Keymap = g:VIMRC.Keymap
autocmd FileType typescript call s:Keymap.mapNormalCommands([
      \ [ '<leader>te', '<Plug>(TsuquyomiRenameSymbol)'],
      \ [ '<leader>tE', '<Plug>(TsuquyomiRenameSymbolC)'],
      \ [ '<leader>ti', '<Plug>(TsuquyomiImportC)'],
      \ [ '<leader>tr', '<Plug>(TsuquyomiRenameSymbol)'],
      \ [ '<leader>trc', '<Plug>(TsuquyomiRenameSymbolC)'],
      \], { 'silent': 0, 'buffer': 1, 'nore': 0 })
