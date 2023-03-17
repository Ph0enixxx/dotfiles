autocmd BufNewFile,BufRead *.flow set filetype=flow

fun! s:SelectFlow()
  " if getline(1) =~# '^#!.*/bin/\%(env\s\+\)\?node\>' || getline(7) =~# ''
  if getline(7) ==# ' * @flow' || getline(1) ==# '// @flow'
    set ft=flow
  endif
endfun

autocmd BufNewFile,BufRead,BufWrite * call s:SelectFlow()
