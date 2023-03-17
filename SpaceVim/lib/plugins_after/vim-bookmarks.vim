"=============================================================================
" vim-bookmarks.vim --- config from plugin MattersGroeger/vim-bookmarks
" Author: Phoenix Tsui < xusiyuan841028@gmail.com >
" License: MIT
"=============================================================================

scriptencoding=utf8

highlight BookmarkSign ctermfg=2 guifg=#f13a82
highlight BookmarkAnnotationSign ctermfg=2 guifg=#40f34c

let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
let g:bookmark_no_default_key_mappings = 1

let s:filetypes = [
      \ 'vista', 'startify', 'calendar', 'fzf',
      \ 'coc-explorer', 'coc_todolist',
      \]

function! BookmarkMapKeys() abort
  if index(s:filetypes, &ft) >= 0
    try
      unmap mm
      unmap mi
      unmap mn
      unmap mp
      unmap ma
      unmap mc
      unmap mx
      unmap mkk
      unmap mjj
    catch
    endtry
  else
    nnoremap mm :BookmarkToggle<cr>
    nnoremap mi :BookmarkAnnotate<cr>
    nnoremap mn :BookmarkNext<cr>
    nnoremap mp :BookmarkPrev<cr>
    nnoremap ma :BookmarkShowAll<cr>
    nnoremap mc :BookmarkClear<cr>
    nnoremap mx :BookmarkClearAll<cr>
    nnoremap mkk :BookmarkMoveUp
    nnoremap mjj :BookmarkMoveDown
  endif
endfunction

augroup bookmark
  autocmd!
  autocmd BufEnter * call BookmarkMapKeys()
augroup END
