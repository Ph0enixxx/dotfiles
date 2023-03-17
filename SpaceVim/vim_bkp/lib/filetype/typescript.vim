augroup typescript
  autocmd!
  autocmd FileType typescript setlocal indentkeys+=0
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript.jsx
augroup END
