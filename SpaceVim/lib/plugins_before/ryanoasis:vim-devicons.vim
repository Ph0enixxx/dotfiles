scriptencoding utf-8

let g:WebDevIconsOS                                = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes        = 1
let g:DevIconsEnableFoldersOpenClose               = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

let g:WebDevIconsUnicodeGlyphDoubleWidth      = 0
let g:webdevicons_conceal_nerdtree_brackets   = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

if has('gui_running')
  let g:WebDevIconsNerdTreeAfterGlyphPadding    = ''
else
  let g:WebDevIconsNerdTreeAfterGlyphPadding    = ' '
endif

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {
      \ 'html'     : '',
      \ 'htm'      : '',
      \ 'art'      : '',
      \ 'xtpl'     : '',
      \ 'es6'      : '',
      \ 'xml'      : '',
      \ 'xsd'      : '',
      \ 'xodr'     : '',
      \ 'xosc'     : '',
      \ 'log'      : '',
      \ 'nvim'     : '',
      \ }

let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {
      \ '.editorconfig'                       : '',
      \ 'editorconfig'                        : '',
      \ '.eslintignore'                       : '',
      \ 'eslintignore'                        : '',
      \ '.gitconfig'                          : '',
      \ 'gitconfig'                           : '',
      \ '.gitignore'                          : '',
      \ 'gitignore'                           : '',
      \ '.git'                                : '',
      \ }



" function! s:setSyntax()
  " if g:webdevicons_conceal_nerdtree_brackets == 1
    " augroup webdevicons_conceal_nerdtree_brackets_for_symlink
      " au!
      " autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=NERDTreeLinkFile
      " autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=NERDTreeLinkDir
      " autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=NERDTreeLinkFile
      " autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=NERDTreeLinkDir
    " augroup END
  " endif
" endfunction

" call s:setSyntax()
