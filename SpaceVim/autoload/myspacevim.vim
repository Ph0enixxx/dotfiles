"=============================================================================
" myspacevim.vim --- bootstrap functions
" Author: Phoenix Xu <xusiyuan841028@gmail.com>
" License: MIT
"=============================================================================

let s:path = resolve(expand('<sfile>:p:h:h')).'/'
let s:logger = SpaceVim#logger#derive('myspace:init')
      
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.status == 'updated' || a:info.force
    echom a:info.status.' '.' YCM'
    " !./install.py --clang-completer --clangd-completer --go-completer --rust-completer --ts-completer --java-completer
  endif
endfunction

function myspacevim#source_files(path) abort
  for file in split(glob(s:path.a:path), '\n')
    try
      exe 'source '.file
    catch
      echom 'source '.file.': Caught error: '.v:exception
      call s:logger.error('source '.file.': Caught error: '.v:exception)
    endtry
  endfor
endfunction

function! myspacevim#before()
  try
    let g:mapleader = ';'
    " call api#utils#set_debug(1)
    
    let g:plug_url_format = 'git@github.com:%s.git'

    " Coc extensions
    let g:coc_global_extensions = [
          \ 'coc-conventional', 'coc-clangd', 'coc-css', 'coc-calc', 'coc-cmake', 'coc-cssmodules',
          \ 'coc-docker', 'coc-spell-checker', 'coc-cspell-dicts',
          \ 'coc-explorer', 'coc-eslint',
          \ 'coc-floatinput', 'coc-flow', 'coc-flutter', 'coc-fzf-preview',
          \ 'coc-git', 'coc-go', 'coc-gocode', 'coc-graphql',
          \ 'coc-highlight', 'coc-html',
          \ 'coc-json', 'coc-jest', 'coc-java', 'coc-jest', 'coc-just-complete', 
          \ 'coc-lists',
          \ 'coc-marketplace', 'coc-markdownlint',
          \ 'coc-prettier', 'coc-project', 'coc-protobuf', 'coc-pyright',
          \ 'coc-react-refactor', 'coc-rls', 'coc-rust-analyzer',
          \ 'coc-snippets', 'coc-sh', 'coc-sql', 'coc-stylelint',
          \ 'coc-tsserver', 'coc-todolist', 'coc-tabnine', 'coc-toml', 'coc-tailwindcss',
          \ 'coc-vimlsp', 'coc-vetur',
          \ 'coc-webpack',
          \ 'coc-xml',
          \ 'coc-yaml', 'coc-yank',
          \]

    " options
    call myspacevim#source_files('lib/set-options.vim')

    " keymap
    call myspacevim#source_files('lib/keymap_before.vim')

    " plugin
    call myspacevim#source_files('lib/plugins_before/*.vim')

    if has('nvim')
      " plugin
      call myspacevim#source_files('lib/plugins_before/*.nvim')
    endif
  catch
    call s:logger.error('myspace#before: Caught error: ' . v:exception)
  endtry
endfunction

function! myspacevim#after()
  try
    " autocmd
    call myspacevim#source_files('lib/autocmd.vim')
    " keymap
    call myspacevim#source_files('lib/keymap_after.vim')
    " highlight
    call myspacevim#source_files('lib/highlight_after.vim')
    " abbreviate
    call myspacevim#source_files('lib/abbreviate.vim')
    " command
    call myspacevim#source_files('lib/command.vim')
    " plugin
    call myspacevim#source_files('lib/plugins_after/*.vim')

    if has('nvim')
      " autocmd
      call myspacevim#source_files('lib/autocmd.nvim')
      " plugin
      call myspacevim#source_files('lib/plugins_after/*.nvim')
    endif

  catch
    call s:logger.error('myspace#after: Caught error: ' . v:exception)
  endtry
endfunction
