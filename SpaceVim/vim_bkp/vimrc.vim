" -----------------------------------------------------------------------------
" phoenix's vimrc file
" -----------------------------------------------------------------------------

silent! py3 pass
if has('python3')
endif

" SYNTAX
if has('syntax') && !exists('g:syntax_on')
  syntax enable
  syntax on
endif

" FILETYPE
if has('autocmd')
  filetype plugin indent on
endif

" SHELL
if &shell =~# 'fish$'
  set shell=sh
endif

let g:vimrc_private = '~/.vimrc.private'

" script encoding
scriptencoding utf-8

" mapleader
let g:mapleader = ';'

" maplocalleader
let g:maplocalleader = '//'

" -----------------------------------------------------------------------------
" source files
" -----------------------------------------------------------------------------

" Options
runtime lib/set-options.vim

" Plug
runtime plug.vim

" functions
runtime lib/function.vim

" Auto cmd
runtime lib/autocmd.vim

" keymap
runtime lib/keymap.vim

" abbreviations
runtime lib/abbreviations.vim

" nop
runtime lib/nop.vim

"command
runtime lib/commands.vim

"fold
runtime lib/fold.vim

"config for kinds of filetype
runtime lib/filetype/*.vim

let s:Keymap = g:VIMRC.Keymap
let s:Utils = g:VIMRC.Utils


" -----------------------------------------------------------------------------
" EDIT
" -----------------------------------------------------------------------------
" APPEARENCE


" -----------------------------------------------------------------------------
" NAVIGATION
" -----------------------------------------------------------------------------
set mouse=                                                 "      Enable the use of mouse

" -----------------------------------------------------------------------------
" SESSION
" -----------------------------------------------------------------------------
set sessionoptions=blank,buffers,curdir,folds,tabpages,    " ssop Change the efffect of the :mksession command
  \ unix,resize,winpos,winsize

" -----------------------------------------------------------------------------
" COLOR SCHEME
" -----------------------------------------------------------------------------
colorscheme solarized
set background=dark

let $LANG='en_US'

" -----------------------------------------------------------------------------
" AUTOCMD
" -----------------------------------------------------------------------------

augroup make
  autocmd!
  autocmd FileType make call s:autocmdMake()
augroup END

function! s:autocmdMake()
  set noexpandtab
endfunction

augroup filetype
  autocmd!
  autocmd BufNewFile,BufRead *.xtpl,*.art  set filetype=html
  autocmd BufNewFile,BufRead *.es6         set filetype=javascript
  autocmd BufNewFile,BufRead .babelrc,.eslintrc
                                         \ set filetype=json
  autocmd BufNewFile,BufRead *.scss        set filetype=scss.css
  autocmd BufNewFile,BufRead .vimrc        set filetype=vim
  autocmd BufRead vim.profile              set filetype=txt

  autocmd FileType vim,javascript,html     setlocal nowrap
augroup END


function! s:changeVimshellPWD()
  if &filetype ==? 'vimshell'
    call vimshell#cd(getcwd())
  endif
endfunction

augroup init
  autocmd!
  autocmd BufEnter * call s:changeVimshellPWD()

  " change the current directory
  "autocmd BufEnter * lcd %:p:h

  " Make sure syntax on
  "autocmd BufEnter * syntax enable

  " source vimrc after save it
  autocmd BufWritePost $MYVIMRC call ReloadVimrc()

  autocmd BufWritePost ~/.vim/abbreviations.vim runtime abbreviations.vim
  autocmd BufWritePost ~/.vim/plug.vim runtime plug.vim

  " Open NERDTree in new tabs and windows if no command line args set
  "autocmd VimEnter *  if has('gui_running') | call OpenProject('last_project') | endif

  " Save project & session
  "autocmd VimLeave *  if has('gui_running') | call SaveWorkspace() | endif

  " Save session
  "autocmd VimLeave * if (has('g:project')) | execute 'mksession ~/.session_'.g:project | endif

augroup END


" VIEW ------------------------------------
" visually select the word
vnoremap <space> iw

" MOTION ----------------------------------

" OPERATOR ------------------------------------

" Reset Keymaps
inoremap <C-TAB> <C-TAB>

"nnoremap <leader>m :w <BAR> !lessc % > %:t:r.css<cr><space>

" BufExplorer

" TODO List
"nnoremap <silent> <F10> :Ack --ignore-dir=node_modules --ignore-file=".view.art.js" TODO <cr>

" Ctrlp
"noremap <silent> <C-SPACE> :CtrlPMRUFiles<cr>
"noremap! <silent> <C-SPACE> <esc>:CtrlPMRUFiles<cr>


" Dash
"map <F1> <Plug>DashSearch
"map <S-F1> :Dash

" Buffer
nnoremap <silent> <D->> :bn<cr>
nnoremap <silent> <D-<> :bp<cr>
nnoremap <silent> ∑ :tabclose<cr>

" Format
"noremap <F5> :Autoformat<CR>

" Color scheme
noremap <silent> ≤ :PrevColorScheme<cr>
noremap <silent> ≥ :NextColorScheme<cr>

" Edit
inoremap <C-L> <esc>ddi
nnoremap <C-L> dd
nnoremap = V=
cmap w!! w !sudo tee > /dev/null %

" Quickfix
call s:Keymap.mapNormalCommands('<leader>qn', ':cnext<cr>', { 'normal': 0 })
call s:Keymap.mapNormalCommands('<leader>qp', ':cprevious<cr>', { 'normal': 0 })
call s:Keymap.mapNormalCommands('<leader>qc', ':cclose<cr>', { 'normal': 0 })
" Location list
call s:Keymap.mapNormalCommands('<leader>ln', ':lnext<cr>', { 'normal': 0 })
call s:Keymap.mapNormalCommands('<leader>lp', ':lprevious<cr>', { 'normal': 0 })
call s:Keymap.mapNormalCommands('<leader>lc', ':lclose<cr>', { 'normal': 0 })

" Syntax

" }}}

" -----------------------------------------------------------------------------
" SETTINGS - Plugins
" -----------------------------------------------------------------------------
" load the config of all plugins
runtime! lib/plugin/**/*.vim

" -----------------------------------------------------------------------------
" SETTINGS - netrw
" -----------------------------------------------------------------------------
let g:netrw_browse_split = 4
"let g:netrw_liststyle = 4
let g:netrw_winsize = 25
let g:netrw_altv = 1

"nnoremap <silent> <F3> :Vexplore<cr>

function! ToggleVexplore()
  if &filetype ==? 'netrw'
    echom 'open'
    Vexplore
  else
    q
  endif
endfunction

augroup ProjectDrawer
  autocmd!
  "autocmd VimEnter * :call TryOpenVexplore()
augroup END

function! TryOpenVexplore()
  if &filetype != 'startify'
    Vexplore
  endif
endfunction

" -----------------------------------------------------------------------------
" SETTINGS - gitgutter
" -----------------------------------------------------------------------------
"let g:gitgutter_realtime = 0
let g:gitgutter_eager     = 0

" -----------------------------------------------------------------------------
" SETTINGS - sjl/splice.vim
" -----------------------------------------------------------------------------
let g:splice_initial_mode = 'grid'
let g:splice_initial_layout_grid = 1
let g:splice_initial_scrollbind_grid = 1
let g:splice_initial_prefix = '<leader>t'
let g:splice_wrap = 'nowrap'

" -----------------------------------------------------------------------------
" SETTINGS - vim-better-whitespace
" -----------------------------------------------------------------------------
let g:better_whitespace_filetypes_blacklist = ['markdown', 'vim', 'startify']

augroup autoFixWhitespace
  autocmd!
  " fix whitespace
  autocmd FileType javascript,java,html,art,xtpl,css,less,sass,php,json,sh,zsh,snippets,vim,graphql,typescript
    \ autocmd BufWritePre <buffer> StripWhitespace
augroup END

" -----------------------------------------------------------------------------
" SETTINGS - osyo-manga/vim-watchdogs
" -----------------------------------------------------------------------------
let g:watchdogs_check_BufWritePost_enable = 1

" -----------------------------------------------------------------------------
" SETTINGS - fatih/vim-go
" -----------------------------------------------------------------------------
let g:go_test_timeout = '10s'
" Keymap
augroup go
  autocmd!
  let s:go_map_options = { 'nore': 0, 'normal': 0 }
  autocmd FileType go call s:Keymap.mapNormalCommands('<leader>t', '<Plug>(go-test)', s:go_map_options)
  autocmd FileType go call s:Keymap.mapNormalCommands('<leader>b', '<Plug>(go-build)', s:go_map_options)
  autocmd FileType go call s:Keymap.mapNormalCommands('<leader>r', '<Plug>(go-run)', s:go_map_options)
augroup END

" -----------------------------------------------------------------------------
" SETTINGS - bling/vim-bufferline
" -----------------------------------------------------------------------------
"let g:bufferline_echo = 0


" -----------------------------------------------------------------------------
" SETTINGS - vim-javascript
" -----------------------------------------------------------------------------
set regexpengine=1
"set foldmethod=syntax

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:javascript_enable_domhtmlcss = 1

"let g:javascript_conceal_function             = "ƒ"
"let g:javascript_conceal_null                 = "ø"
"let g:javascript_conceal_this                 = "@"
"let g:javascript_conceal_return               = "⇚"
"let g:javascript_conceal_undefined            = "¿"
"let g:javascript_conceal_NaN                  = "ℕ"
"let g:javascript_conceal_prototype            = "¶"
"let g:javascript_conceal_static               = "•"
"let g:javascript_conceal_super                = "Ω"
"let g:javascript_conceal_arrow_function       = "⇒"
"let g:javascript_conceal_noarg_arrow_function = "🞅"
"let g:javascript_conceal_underscore_arrow_function = "🞅"

" -----------------------------------------------------------------------------
" SETTINGS - python-mode/python-mode
" -----------------------------------------------------------------------------
"let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_options_max_line_length = 119
let g:pymode_options_colorcolumn = 1

let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6

let g:pymode_lint_on_write = 1
let g:pymode_lint_message = 1
let g:pymode_lint_cwindow = 1
let g:pymode_lint_signs = 1

let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1

let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 0
let g:pymode_syntax_highlight_async_await = g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_string_formatting = g:pymode_syntax_all
let g:pymode_syntax_string_format = g:pymode_syntax_all
let g:pymode_syntax_string_templates = g:pymode_syntax_all
let g:pymode_syntax_doctests = g:pymode_syntax_all
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all
let g:pymode_syntax_builtin_types = g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all
let g:pymode_syntax_docstrings = g:pymode_syntax_all

" -----------------------------------------------------------------------------
" SETTINGS - othree/html5.vim
" -----------------------------------------------------------------------------
let g:html5_event_handler_attributes_complete = 0

" -----------------------------------------------------------------------------
" SETTINGS - plasticboy/vim-markdown
" -----------------------------------------------------------------------------
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_new_list_item_indent = 2

" -----------------------------------------------------------------------------
" SETTINGS - suan/vim-instant-markdown
" -----------------------------------------------------------------------------
let g:instant_markdown_slow = 1

" -----------------------------------------------------------------------------
" SETTINGS - Eclim
" -----------------------------------------------------------------------------
let g:EclimFileTypeValidate = 0

" -----------------------------------------------------------------------------
" SETTINGS - vimlint
" -----------------------------------------------------------------------------
let g:vimlint#config = {}
let g:vimlint#config.EVL205=1

" -----------------------------------------------------------------------------
" SETTINGS - php-indent
" -----------------------------------------------------------------------------
let g:PHP_outdentSLComments = 1
let g:PHP_default_indenting = 1
let g:PHP_BracesAtCodeLevel = 1
" -----------------------------------------------------------------------------
"
" SETTINGS - ervandew/supertab
" -----------------------------------------------------------------------------
"let g:SuperTabDefaultCompletionType='<C-TAB>'

" -----------------------------------------------------------------------------
" SETTINGS - emmet-vim
" -----------------------------------------------------------------------------
"let g:user_emmet_install_global = 0
"let g:user_emmet_expandabbr_key = '<C-E>'
"let g:user_emmet_settings = {
"\  'javascript.jsx': {
"\    'extends': 'jsx',
"\  },
"\  'javascript': {
"\    'extends': 'jsx',
"\  },
"\}
"let g:user_emmet_leader_key='<C-Z>'

"autocmd FileType html,css,javascript,markdown EmmetInstall

" -----------------------------------------------------------------------------
" SETTINGS - vim-jsx
" -----------------------------------------------------------------------------
let g:jsx_ext_required = 0      " Allow JSX in normal JS files

" -----------------------------------------------------------------------------
" SETTINGS - colorscheme-switcher
" -----------------------------------------------------------------------------
let g:colorscheme_switcher_define_mappings=0

" -----------------------------------------------------------------------------
" SETTINGS - altercation/vim-colors-solarized
" -----------------------------------------------------------------------------
let g:solarized_visibility="hight"

" -----------------------------------------------------
" Function: select a jump in the list
" -----------------------------------------------------
function! GotoJump()
  jumps
  let l:jump = input("Please select your jump: ")
  if l:jump != ''
    let pattern = '\v\c^\+'
    if l:jump =~ pattern
      let l:jump = substitute(l:jump, pattern, '', 'g')
      execute "normal " . l:jump . "\<c-i>"
    else
      execute "normal " . l:jump . "\<c-o>"
    endif
  endif
endfunction
