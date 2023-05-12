" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory = ['~/.vim/bundle/vim-snippets/snippets']

" For conceal markers.
if has('conceal')
  " set conceallevel=2 concealcursor=niv
endif
