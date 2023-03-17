"FUNCTION: api#utils#use_tool_panel_appearance(){{{1
function! g:api#logger#create(name) abort
  let l:logger = SpaceVim#logger#derive(a:name)
  function! logger.debug(msg) abort closure
    if api#utils#is_debug()
      call l:logger.info('[ DEBUG ] '.msg)
    endif
  endfunction
  return l:logger
endfunction
"}}}0
