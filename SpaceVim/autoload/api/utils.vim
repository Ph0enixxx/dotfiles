" Utility Functions

function! api#utils#on_term_open() abort
  startinsert
  let &l:statusline = SpaceVim#layers#core#statusline#get(1)
endfunction

function! api#utils#test() abort
  echom 'test function run!'
endfunction

let s:debug = v:false

"FUNCTION: api#utils#is_debug(){{{1
function! api#utils#is_debug() abort
  return s:debug
endfunction
"}}}

"FUNCTION: api#utils#set_debug(){{{1
function! api#utils#set_debug(enable) abort
  let s:debug = a:enable
endfunction
"}}}

"FUNCTION: api#utils#osx(){{{1
function! api#utils#osx() abort
  return has('macunix')
endfunction
"}}}

"FUNCTION: api#utils#linux(){{{1
function! api#utils#linux() abort
  return has('unix') && !has('macunix') && !has('win32unix')
endfunction
"}}}

"FUNCTION: api#utils#linux(){{{1
function! api#utils#windows() abort
  return  (has('win32') || has('win64'))
endfunction
"}}}

"FUNCTION: api#utils#reload_vimrc(){{{1
function! api#utils#reload_vimrc() abort
  source $MYVIMRC
  call api#utils#try_executh('AirlineRefresh')
endfunction
"}}}

"FUNCTION: api#utils#exists_plugin(name: string){{{1
function! api#utils#exist_plugin(name) abort
  return !empty(api#utils#get_plugin(a:name))
endfunction
"}}}

function! s:get_plugin(name)
  if g:spacevim_plugin_manager ==# 'dein'
    return dein#get(a:name)
  " TODO: support more plugin managers
  " elseif g:space_plugin_manager ==# 'neobundle'
  " elseif g:space_plugin_manager ==# 'vim-plug'
  else
    return {}
  endif
endfunction

" FUNCTION: api#utils#get_plugin(name: string){{{1
function! api#utils#get_plugin(name) abort
  if empty(a:name)
    return {}
  endif
  let plugin = s:get_plugin(a:name)
  if empty(plugin)
    let words = split(a:name, '/')
    let group_name = len(words) >= 2 ? words[0] : ''
    let repo_name = len(words) >= 2 ? words[1] : words[0]

    if empty(group_name)
      return {}
    else
      let plugin = s:get_plugin(repo_name)
      if empty(plugin)
        return {}
      else
        let repo = get(plugin, 'repo')

        if repo ==? a:name
          return plugin
        else
          return {}
        endif
      endif
    endif
  else
    return plugin
  endif
endfunction
"}}}

"FUNCTION: api#utils#exist_file(path: string): boolean{{{1
function! api#utils#exist_file(path) abort
  return filereadable(expand(a:path))
endfunction
"}}}

"FUNCTION: api#utils#try_source(path: string){{{1
function! api#utils#try_source(path) abort
  if api#utils#exist_file(a:path)
    execute 'source '.fnameescape(a:path)
  endif
endfunction
"}}}

"FUNCTION: api#utils#try_execute(cmd: string){{{1
function! api#utils#try_execute(cmd) abort
  if exists(a:cmd)
    execute a:cmd
  endif
endfunction
"}}}

"FUNCTION: api#utils#open_help_tab(){{{1
function! api#utils#open_help_tab() abort
  if !(getcmdwintype() == ':' && col('.') <= 2)
    return 'h'
  endif

  let helptabnr = 0
  for i in range(tabpagenr('$'))
    let tabnr = i + 1
    for bufnr in tabpagebuflist(tabnr)
      if getbufvar(bufnr, "&ft") == 'help'
        let helptabnr = tabnr
        break
      endif
    endfor
  endfor

  if helptabnr
    if tabpagenr() == helptabnr
      return 'h'
    else
      return 'tabnext '.helptabnr.' | h'
    endif
  else
    return 'tab h'
  endif
endfunction
"}}}


"FUNCTION: api#utils#open_vsplit(file_name: string){{{1
function! api#utils#open_vsplit(file_name) abort
  " TODO: how to check the buffer is totally new?
  if &filetype ==? '' && &buftype ==? ''
    exec 'edit '.a:file_name
  else
    exec 'botright vsplit '.a:file_name
  endif
endfunction
"}}}

"FUNCTION: api#utils#start_profile(){{{1
function! api#utils#start_profile() abort
 profile start ~/.vim/vim.profile
 profile func *
 profile file ~/.vim/plugged/nerdtree/*/*.vim
endfunction
"}}}

"FUNCTION: api#utils#stop_profile(){{{1
function! api#utils#stop_profile() abort
  profile pause
  noautocmd qall!
endfunction
"}}}

"FUNCTION: api#utils#use_tool_panel_appearance(){{{1
function! api#utils#use_tool_panel_appearance(...) abort
  setlocal nocursorcolumn
  setlocal nonumber
  setlocal nolist
  setlocal norelativenumber
  setlocal signcolumn=no
  setlocal foldcolumn=0
endfunction
"}}}

" vim: set fdm=marker :
