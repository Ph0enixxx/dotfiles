"=============================================================================
" set-options.vim --- set options
" Author: Phoenix Tsui <xusiyuan841028@gmail.com>
" License: MIT
"=============================================================================

" PYTHON VIRTUALENVS
set pyxversion=3
let g:python3_host_prog = '~/.pyenv/shims/python'

let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

" -----------------------------------------------------------------------------
" SYSTEM
" -----------------------------------------------------------------------------
set nocompatible                                           " cp   close vi-compatible
set mouse=
set backupcopy=yes                                         " bkc  do when writing a file and a backup is made
set redrawtime=5000
set updatetime=500
set noautoread                                             " ar   automatically read file when changed
set autowrite                                              " aw   automatically write file when changed
set history=50                                             " hi   command line history
set sidescroll=10                                          " ss   the minimal number of columns to scroll horizontally
set whichwrap=b,s,<,>,~,[,]                                " ww   move cursor left/right to the previous/next line

" -----------------------------------------------------------------------------
" PATH
" -----------------------------------------------------------------------------
set noautochdir                                              " acd  change the current working driectory
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*.swp,*.tmp
set wildignore+=tags,.tags
set wildmenu
set wildmode=longest,list

" -----------------------------------------------------------------------------
" APPEARANCE
" -----------------------------------------------------------------------------
set autoindent
set backspace=indent,eol,start                             " bs   allow backspacing over everything in insert mode
set cmdwinheight=10                                        " cwh  set command-line window height
set colorcolumn=121,161                                    " cc   highlight column
set cursorcolumn
set cursorline
set display+=lastline
set guioptions-=mTrL
set guioptions+=c
set guicursor-=a:Cursor/lCursor

set list                                                   " list list mode
set listchars=tab:>\ ,trail:_,extends:>,precedes:<,nbsp:+  " lcs  strings to use in list mode
set number                                                 " nu   line number
set previewheight=20                                       " pvh
set ruler                                                  " ru   show the cursor position all the time
set relativenumber
set scrolloff=2                                            " so   keep 2 lines as the scrolling context
set sidescrolloff=5
set showcmd                                                " sc   display incomplete command
set termguicolors
set textwidth=120                                          " tw   maxium width of text
set nowrap                                                 " wrap wrap text
set nrformats=hex
set synmaxcol=400

call api#ui#auto_set_font_size()

" -----------------------------------------------------------------------------
" FOLD
" -----------------------------------------------------------------------------
set nofoldenable
set foldcolumn=1
set foldclose=all
set foldlevel=0
set foldmethod=syntax
set foldnestmax=1
set foldopen=all
set foldtext=MinimalFoldText()

" highlight Folded guibg=grey guifg=blue
" highlight FoldColumn guibg=darkgrey guifg=white

" let vimscript_fold = 1

function! MinimalFoldText() abort
  let fs = v:foldstart
  while getline(fs) !~ '\w'
    let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
    let line = getline(v:foldstart)
  else
    let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let w = winwidth(0) - &foldcolumn - &number * &numberwidth
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat("  +  ", v:foldlevel)
  let lineCount = line("$")
  let expansionString = repeat(" ", w - strwidth(foldSizeStr.line.foldLevelStr))
  return line . expansionString . foldSizeStr . foldLevelStr
endfunction

" -----------------------------------------------------------------------------
" SEARCH
" -----------------------------------------------------------------------------
set hlsearch                                               " hls  highlight search string
set ignorecase                                             " ic   ignore case in search pattern
set incsearch                                              " is   do incremental searching
set smartcase                                              " scs  override the 'ignorecase' option if the search pattern contains upppercase char

" -----------------------------------------------------------------------------
" TAB
" -----------------------------------------------------------------------------
set expandtab                                              " et   Use the appropriate number of spaces to insert a <Tab>
set shiftround
set shiftwidth=2                                           " sw   Number of spaces to use for each step of (auto)indent
set smarttab
set softtabstop=2
set tabstop=2                                              " ts   Number of spaces that a <Tab> in the file counts for


" -----------------------------------------------------------------------------
" ENCODE AND LANGUAGE
" -----------------------------------------------------------------------------
set fileformats=unix,dos                                   " ff   file format
set helplang=en                                            " hlg   set help language to English
set encoding=utf-8                                         " enc   set the character encoding
set fileencodings=utf-8,gbk,gb2312,gb18030                 " fencs set a list of character encodings
set termencoding=utf-8
set langmenu=en_US

set completeopt+=preview

filetype plugin indent on
" set guicursor=a:block-blinkon0,i:ver30-blinkon0
" set splitbelow
" set splitright
