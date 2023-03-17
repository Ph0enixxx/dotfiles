
let s:file = expand('<sfile>:~')
let s:unite_lnum = expand('<slnum>') + 3
function! s:defind_fuzzy_finder() abort
  nnoremap <silent> <Leader>fr
        \ :<C-u>Denite -resume<CR>
  let lnum = expand('<slnum>') + s:unite_lnum - 4
  let g:_spacevim_mappings.f.r = ['Denite -resume',
        \ 'resume unite window',
        \ [
        \ '[Leader f r ] is to resume unite window',
        \ '',
        \ 'Definition: ' . s:file . ':' . lnum,
        \ ]
        \ ]
  nnoremap <silent> <Leader>fe
        \ :<C-u>Denite register<CR>

"FUNCTION: api#autocmd#filetype(){{{1
function SpaceVim#custom#Leader(m, keys, cmd, desc, is_cmd) abort
  call g:api#keymap#map_normal_commands(join(keys), cmd)
  " function! g:api#keymap#map_normal_commands(...)
  nnoremap <silent> <Leader>fr
  " call add(g:_spacevim_mappings.i, [a:m, a:keys, a:cmd, a:desc, a:is_cmd])
  " for
  " let g:_spacevim_mappings[a]
endfunction
"}}}




