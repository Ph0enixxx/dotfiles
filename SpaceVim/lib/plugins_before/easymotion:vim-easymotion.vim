map \ <Plug>(easymotion-prefix)

let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = "ASDFGHJKL;'WERUIOVN"

" <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)
"
" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)
"
" Move to line
" map <Leader>L <Plug>(easymotion-bd-jk)
" nmap <Leader>L <Plug>(easymotion-overwin-line)
"
" Move to word
" map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)

augroup EasyMotion
  au!
  autocmd User EasyMotionPromptBegin silent! CocDisable
  autocmd User EasyMotionPromptEnd silent! CocEnable
augroup END
