if has('macunix')
  let g:Hexokinase_highlighters = ['foregroundfull', 'virtual']
else
  let g:Hexokinase_highlighters = ['backgroundfull']
endif


let g:Hexokinase_ftDisabled = [
      \ 'calendar', 'coc-explorer', 'coc_todolist',
      \ 'floaterm', 'fzf',
      \ 'help',
      \ 'nerdtree', 
      \ 'startify', 
      \ 'vimfiler', 'vista',
      \ ]

