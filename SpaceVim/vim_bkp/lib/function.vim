
"FUNCTION: autocmd#filetype(file_type, func){{{1
function! g:autocmd#filetype(file_type, func)
  echom l:file_type
  let l:filetype = get(s:filetypes, a:file_type, [])
  s:filetypes[a:file_type] = add(l:filetype, func)
endfunction
"}}}

