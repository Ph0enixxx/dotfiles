" Don't change directory (default). >
let g:rooter_change_directory_for_non_project_files = ''

" directories and all files (default)
let g:rooter_targets = '/,*'

" specify how to identify a project's root directory
" JavaScript, Java, Python, Ruby, C/C++, Rust, Golang, Git repo
let g:rooter_patterns = [ '*.pom', 'requirements.txt', 'Rakefile', 'Makefile', 'Cargo.toml', 'go.mod', '.git', 'package.json' ]

" change directory for the current window only (:lcd)
let g:rooter_cd_cmd = 'lcd'

" stop vim-rooter echoing the project directory
let g:rooter_silent_chdir = 0
