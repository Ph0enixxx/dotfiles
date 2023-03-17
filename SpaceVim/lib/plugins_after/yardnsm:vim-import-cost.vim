
if !exists(':ImportCost')
  finish
endif

augroup ImportCost
  autocmd!
  autocmd BufReadPost  *.js,*.jsx,*.ts,*.tsx ImportCost
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx ImportCost
  " autocmd CursorHold   *.js,*.jsx,*.ts,*.tsx ImportCost
augroup END

hi ImportCostVirtualText ctermfg=0 guifg=#7E221F
let g:import_cost_virtualtext_prefix = ' ‣ '

