augroup javascript
  autocmd!
  autocmd FileType javascript call s:autocmdJavaScript()
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

function! s:autocmdJavaScript()
  nnoremap <buffer> <D-d> :TernDef<cr>
  nnoremap <buffer> <D-r> :TernRename<cr>
endfunction
