" normal
call api#keymap#map_normal_commands('<f2>', ':BufExplorer<cr>', { 'normal': 0 })
call api#keymap#map_normal_commands('<f3>', ':CocCommand explorer<cr>', { 'normal': 0 })
call api#keymap#map_normal_commands('<f4>', ':Files<cr>', { 'normal': 0 })
call api#keymap#map_normal_commands('<f5>', ':Vista<cr>', { 'normal': 0 })
call api#keymap#map_normal_commands('<f6>', ':MundoToggle<cr>', { 'normal': 0 })

" visual
call api#keymap#map_visual_commands('zz', '<esc>', { 'normal': 0 })

" insert
" call g:api#keymap#map_insert_commands('zz', 'pumvisible() ? "\<c-e>" : "\<esc>"', { 'normal': 0, 'expr': 1, 'nore': 0 })

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                 [WIN]                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:_spacevim_mappings_windows['1'] = ['normal! 1gt', 'tab 1']
let g:_spacevim_mappings_windows['2'] = ['normal! 2gt', 'tab 2']
let g:_spacevim_mappings_windows['3'] = ['normal! 3gt', 'tab 3']
let g:_spacevim_mappings_windows['4'] = ['normal! 4gt', 'tab 4']
let g:_spacevim_mappings_windows['5'] = ['normal! 5gt', 'tab 5']
let g:_spacevim_mappings_windows['6'] = ['normal! 6gt', 'tab 6']
let g:_spacevim_mappings_windows['7'] = ['normal! 7gt', 'tab 7']
let g:_spacevim_mappings_windows['8'] = ['normal! 8gt', 'tab 8']
let g:_spacevim_mappings_windows['9'] = ['normal! 9gt', 'tab 9']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                 [EasyMotion]                                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" call SpaceVim#mapping#guide#register_prefix_descriptions('h', 'g:_spacevim_mappings_easymotion')
" let g:_spacevim_mappings_easymotion = { 'name': '+h prefix'}
" call SpaceVim#plugins#help#regist_root({'[EasyMotion]': g:_spacevim_mappings_easymotion})
" let g:_spacevim_mappings_prefixs['h'] = g:_spacevim_mappings_easymotion
" let g:_spacevim_mappings_easymotion.i = ['normal! mqviwgu`q', 'convert current word to lowercase']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                 [Leader]                                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:_spacevim_mappings.i = {'name' : '+Edit Utilities'}
" call SpaceVim#custom#Leader('nnoremap', ['i', 'u'], 'execute "normal! mqviwgU`q"', 'convert current word to uppercase', 1)
