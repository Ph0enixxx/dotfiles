function! s:LoadFile()
  if getfsize(expand('<afile>')) > 2*1024*1024
    " syntax off
    setlocal eventignore=all
  endif
endfunction

augroup PreviewAutocmds
  autocmd!
  autocmd WinEnter * if &previewwindow | setlocal wrap | endif
  " autocmd WinEnter * hi CursorLine ctermbg=0 ctermfg=0 guibg=#073642 guifg=NONE guisp=#93a1a1
augroup END

augroup OpenLargeFile
  autocmd!
  autocmd BufReadPre * call s:LoadFile()
augroup END

let s:cmdwin_map_options = { 'buffer': 1, 'normal': 0, 'insert': 0 }
augroup CmdWindow
  autocmd!
  autocmd CmdwinEnter * call g:api#keymap#map_insert_commands('<esc>', '<c-c><c-c>', s:cmdwin_map_options)
  autocmd CmdwinEnter * call g:api#keymap#map_normal_commands([['<esc>', '<c-c><c-c>'], ['q', '<c-c><c-c>']], s:cmdwin_map_options)
  autocmd CmdwinEnter * call api#utils#use_tool_panel_appearance()
  autocmd CmdwinEnter * hi NonText cterm=bold ctermfg=11            gui=bold guifg=#dc322e guibg=#002b36
  autocmd CmdwinLeave * hi clear NonText
augroup END

augroup TermWindow
  autocmd!
  autocmd TermEnter * call api#utils#use_tool_panel_appearance()
augroup END

