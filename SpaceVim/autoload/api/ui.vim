"FUNCTION: api#utils#auto_set_font_size(){{{1
function! api#ui#auto_set_font_size() abort
  set guifont=DejaVuSansMono\ Nerd\ Font\ Mono:h15
  if has('mac')
    let width = system("osascript -e 'tell application \"Finder\" to get bounds of window of desktop' | cut -d ' ' -f 3 | cut -d ',' -f 1")
    if width > 3200
      " 4k screen
      set guifont=DejaVuSansMono\ Nerd\ Font:h18
    elseif width > 1920
      " 2k screen
      set guifont=DejaVuSansMono\ Nerd\ Font:h16
    elseif width > 1680
      set guifont=DejaVuSansMono\ Nerd\ Font:h15
    else
      set guifont=DejaVuSansMono\ Nerd\ Font:h13
    endif
  endif
  return &guifont
endfunction
"}}}
