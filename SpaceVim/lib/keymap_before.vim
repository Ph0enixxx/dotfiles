" command line
" call g:api#keymap#map_normal_commands('/', 'q/i', { 'normal': 0 })
" call g:api#keymap#map_normal_commands(':', 'q:i', { 'normal': 0 })
" call g:api#keymap#map_normal_commands('?', 'q?i', { 'normal': 0 })
call g:api#keymap#map_normal_commands('<m-a>', 'ggVG', { 'normal': 0 })

call g:api#keymap#map_normal_commands('<esc>', ':call coc#float#close_all()<cr>', { 'normal': 0 })


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                 [SPC]                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config
call SpaceVim#custom#SPC('nnoremap', ['f', 'v', 'f'], 'call SpaceVim#custom#load()', 'reload custom configuration', 1)

" Profile
call SpaceVim#custom#SPC('nnoremap', ['f', 'v', 's'], 'call g:api#utils#start_profile()', 'start vim performance profile', 1)
call SpaceVim#custom#SPC('nnoremap', ['f', 'v', 't'], 'call g:api#utils#stop_profile()', 'stop vim performace profile', 1)

" Log
call SpaceVim#custom#SPC('nnoremap', ['f', 'v', 'l'], 'call SpaceVim#logger#viewRuntimeLog()', 'view spacevim runtime log', 1)
call SpaceVim#custom#SPC('nnoremap', ['f', 'v', 'L'], 'call SpaceVim#logger#viewLog(1)', 'view spacevim all log', 1)

" LSP
" @TODO: Language Specified
" call SpaceVim#custom#SPCGroupName(['k'], '+LSP')
" call SpaceVim#custom#SPC('nnoremap', ['k', 'd'], 'call SpaceVim#lsp#show_doc()', 'show documentation', 1)
" call SpaceVim#custom#SPC('nnoremap', ['k', 'f'], 'call SpaceVim#lsp#go_to_def()', 'go to definition', 1)
" call SpaceVim#custom#SPC('nnoremap', ['k', 'c'], 'call SpaceVim#lsp#go_to_declaration()', 'go to declaration', 1)
" call SpaceVim#custom#SPC('nnoremap', ['k', 't'], 'call SpaceVim#lsp#go_to_typedef()', 'go to type definition', 1)
" call SpaceVim#custom#SPC('nnoremap', ['k', 'i'], 'call SpaceVim#lsp#go_to_impl()', 'go to implementation', 1)
" call SpaceVim#custom#SPC('nnoremap', ['k', 'l'], 'call SpaceVim#lsp#references()', 'go to references', 1)
" call SpaceVim#custom#SPC('nnoremap', ['k', 'r'], 'call SpaceVim#lsp#rename()', 'rename', 1)
" call SpaceVim#custom#SPC('nnoremap', ['k', 'R'], 'call SpaceVim#lsp#refactor()', 'refactor', 1)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                 [Leader]                                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
" call SpaceVim#mapping#def('nnoremap <silent>', '<leader>fr', ['FzfMenu MyStarredrepos', 'fuzzy finde stared repositories'])
" call SpaceVim#custom#SPC('nnoremap', ['z', 'p'], 'FzfMenu Projects', 'Projects', 1)
" call SpaceVim#custom#SPC('nnoremap', ['z', 'r'], 'FzfMenu MyStarredrepos', 'Starred repos', 1)

let g:_spacevim_mappings.i = {'name' : '+Edit Utilities'}

" convert the current word to uppercase
" let g:_spacevim_mappings.i.U = [, 'convert current word to uppercase']

" convert the current word to lowercase
" let g:_spacevim_mappings.i.u = ['normal! mqviwgu`q', 'convert current word to lowercase']

" surround the world in backticks
" let g:_spacevim_mappings.i['`'] = ['normal! mqviw\<c-v>\<esc>a\`\<c-v>\<esc>hbi\`\<c-v>\<esc>lel`ql', 'surround the world in backticks']

" surround the world in double quotes
" let g:_spacevim_mappings.i['"'] = ['normal! mqviw<c-v><esc>a\"<c-v><esc>bi\"<c-v><esc>lel`ql', 'surround the world in double quotes']

" surround the world in single quotes
" let g:_spacevim_mappings.i["'"] = ['normal! mqviw<c-v><esc>a''<c-v><esc>hbi''<c-v><esc>lel`ql', 'surround the world in single quotes']

" surround the world in parenthesis
" let g:_spacevim_mappings.i['('] = ['normal! mqviw<c-v><esc>a)<c-v><esc>hbi(<c-v><esc>lel`ql', 'surround the world in parenthesis']
   
" surround the world in brackets
" let g:_spacevim_mappings.i['['] = ['normal! mqviw<c-v><esc>a]<c-v><esc>hbi[<c-v><esc>lel`ql', 'surround the world in brackets']
"
" surround the world in braces
" let g:_spacevim_mappings.i['{'] = ['normal! mqviw<c-v><esc>a<space>}<c-v><esc>hbi{<space><c-v><esc>lel`ql', 'surround the world in braces']
"
" surround the lines in braces
" let g:_spacevim_mappings.i['}'] = ['normal! mqkA<c-v><space>{<c-v><esc>`qA<c-v><cr>}<c-v><esc>k=`q', 'surround the lines in braces']

" append semicolon into the end of line
" let g:_spacevim_mappings.i[';'] = ['normal! mqA;<c-v><esc>`q', 'append semicolon into the end of line']

" append comma into the end of line
" let g:_spacevim_mappings.i[','] = ['call feedkeys("mqA,\<c-v>\<esc>`q", "n")', 'append comma into the end of line']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                 [c]: Change Buffer                                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call api#utils#set_debug(1)
call g:api#keymap#map_normal_commands('c', '[Change]', { 'silent': 0, 'nore': 0 })
call g:api#keymap#map_normal_commands('[Change]', ':<c-u>LeaderGuide "c"<cr>', { 'nowait': 1 })
" call g:api#keymap#map_view_commands('c', '[Change]', { 'silent': 0, 'nore': 0 })
" call g:api#keymap#map_visual_commands('[Change]', ':<c-u>LeaderGuideVisual "c"<cr>', { 'nowait': 1 })
call api#utils#set_debug(0)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                 Common                                                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
tnoremap <Esc> <C-\><C-n>

" Navigate windows from any model:
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
inoremap <A-h> <C-\><C-n><C-w>h
inoremap <A-j> <C-\><C-n><C-w>j
inoremap <A-k> <C-\><C-n><C-w>k
inoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

