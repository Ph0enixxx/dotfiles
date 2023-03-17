let s:Keymap = g:VIMRC.Keymap

" let s:config_tab = deepcopy(s:config)
" let s:config_tab['sink'] = 'tabe'
" let s:config_sp = deepcopy(s:config)
" let s:config_sp['sink'] = 'vsp'

" call s:Keymap.mapNormalCommands([
      " \ [ '<leader>f', ':call fzf#run('.string(s:config_tab).')<cr>'],
      " \ [ '<leader>fv', ':call fzf#run('.string(s:config_sp).')<cr>'],
      " \ [ '<leader>F', ':FZF '],
      " \], { 'silent': 1 })

noremap <plug>(slash-after) zz

