if get(g:, 'spacevim_enable_key_frequency', 0)
  nnoremap <expr><buffer> q SpaceVim#mapping#frequency#update('q', ':<C-U>call SpaceVim#mapping#SmartClose()<CR>')
else
  nnoremap <expr><buffer> q :<C-U>call SpaceVim#mapping#SmartClose()<CR>
endif
