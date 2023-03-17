" -----------------------------------------------------------------------------
" SYSTEM
" -----------------------------------------------------------------------------
set nocompatible                                           " cp   close vi-compatible
set backupcopy=yes                                         " bkc  do when writing a file and a backup is made
set redrawtime=5000
set updatetime=500
set noautoread                                             " ar   automatically read file when changed
set autowrite                                              " aw   automatically write file when changed
set history=50                                             " hi   command line history
set sidescroll=10                                          " ss   the minimal number of columns to scroll horizontally
set whichwrap=b,s,<,>,~,[,]                                " ww   move cursor left/right to the previous/next line

" -----------------------------------------------------------------------------
" path
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
set cmdheight=1                                            " ch   set command height
set cmdwinheight=6                                         " cwh  set command-line window height
set colorcolumn=101,121                                    " cc   highlight column
set cursorcolumn                                           " cuc  highlight current column
set cursorline                                             " cul  highlight current line
set display+=lastline
set guicursor=a:block-blinkon0,i:ver30-blinkon0
set guioptions-=mTrL
set guioptions+=c
set list                                                   " list list mode
set listchars=tab:>\ ,trail:_,extends:>,precedes:<,nbsp:+  " lcs  strings to use in list mode
set number                                                 " nu   line number
set previewheight=10                                       " pvh
set ruler                                                  " ru   show the cursor position all the time
set relativenumber
set scrolloff=2                                            " so   keep 2 lines as the scrolling context
set sidescrolloff=5
set showcmd                                                " sc   display incomplete command
" set splitbelow
" set splitright
set textwidth=120                                          " tw   maxium width of text
set nowrap                                                 " wrap wrap text
set nrformats=hex

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
