let s:groupNames = []

"FUNCTION: api#autocmd#filetype(){{{1
function g:api#autocmd#filetype(filetypes, func, group) abort
  let filetypes = a:filetypes
  if type(filetypes) != v:t_list
    let filetypes = [filetypes]
  endif
  if exists('*'.a:func)
    let filetypes = join(filetypes, ',')
    if a:group == ''
      throw 'augroup name is required!'
    elseif index(s:groupNames, a:group) >= 0
      throw 'augroup '.a:group.' has been used!'
    else
      call add(s:groupNames, a:group)
      exec 'augroup api#autocmd#filetype#'.a:group.' | '.'autocmd! FileType '.filetypes.' call '.a:func.'() | augroup END'
    endif
  else
    throw 'function '.a:func.' doesn''t exists!'
  endif
endfunction
"}}}
