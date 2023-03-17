" fzf
let g:fzf_history_dir = '~/.SpaceVim.d/fzf-history'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn'],
  \ 'bg+':     ['bg', 'airline_term_inactive_bold', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
  " \ 'hl':      ['fg', 'Todo'],
  
" let g:fzf_preview_window = ['right:60%:hidden', 'ctrl-/']

let s:preview = escape("--preview '[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || " .
  \ "(highlight -O xterm256 --base16 -s solarized-dark -l {} || cat {}) 2> /dev/null | cat' " .
  \ "--color hl:1,fg+:15,bg+:0,hl+:9", '|')

" (highlight -O xterm256 -s moria -l {} || cat {}) 2> /dev/null | cat' " .
"(/usr/local/bin/highlight {} || cat {}) 2> /dev/null | cat' " .

let s:config = {
\ 'options': '--border --inline-info ',
\ 'source': '$(brew --prefix)/bin/fd/bin/fd --type f --hidden -E .git -E node_modules -E .DS_Store -E tags',
\ 'down': 20,
\}

let s:config_tab = deepcopy(s:config)
let s:config_tab['sink'] = 'tabe'
let s:config_sp = deepcopy(s:config)
let s:config_sp['sink'] = 'vsp'


" call s:Keymap.mapNormalCommands([
      " \ [ '<leader>f', ':call fzf#run('.string(s:config_tab).')<cr>'],
      " \ [ '<leader>fv', ':call fzf#run('.string(s:config_sp).')<cr>'],
      " \ [ '<leader>F', ':FZF '],
      " \], { 'silent': 1 })

" Mapping selecting mappings
" nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'right': '15%'})

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_(spec, 'up:10:wrap', 'ctrl-\'), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

call SpaceVim#custom#SPCGroupName(['z'], '+FZF')
call SpaceVim#custom#SPC('nnoremap', ['z', 'f'], 'Files!', 'Files', 1)
call SpaceVim#custom#SPC('nnoremap', ['z', 'b'], 'Buffers!', 'Buffers', 1)
call SpaceVim#custom#SPC('nnoremap', ['z', 'c'], 'Commands!', 'Commands', 1)
call SpaceVim#custom#SPC('nnoremap', ['z', 'k'], 'Marks!', 'Marks', 1)
call SpaceVim#custom#SPC('nnoremap', ['z', 'l'], 'Lines!', 'Lines', 1)
call SpaceVim#custom#SPC('nnoremap', ['z', 'L'], 'BLines!', 'Buffer lines', 1)
call SpaceVim#custom#SPC('nnoremap', ['z', 'm'], 'Maps!', 'Maps', 1)
call SpaceVim#custom#SPC('nnoremap', ['z', 's'], 'RG!', 'Search string', 1)
call SpaceVim#custom#SPC('nnoremap', ['z', 'w'], 'Windows!', 'Windows', 1)

call SpaceVim#custom#SPCGroupName(['z', 'g'], '+Git')
call SpaceVim#custom#SPC('nnoremap', ['z', 'g', 'f'], 'GFiles?', 'Files', 1)
call SpaceVim#custom#SPC('nnoremap', ['z', 'g', 'c'], 'Commits', 'Commit', 1)
call SpaceVim#custom#SPC('nnoremap', ['z', 'g', 'C'], 'BCommits', 'Buffer commit', 1)

call SpaceVim#custom#SPCGroupName(['z', 'h'], '+History')
call SpaceVim#custom#SPC('nnoremap', ['z', 'h', 'f'], 'History', 'File history', 1)
call SpaceVim#custom#SPC('nnoremap', ['z', 'h', 'c'], 'History:', 'Command history', 1)
call SpaceVim#custom#SPC('nnoremap', ['z', 'h', 's'], 'History/', 'Search history', 1)
