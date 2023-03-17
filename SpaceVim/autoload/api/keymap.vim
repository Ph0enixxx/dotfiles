" Keymap
let s:option_default = {
  \ 'nore'  : 1,
  \ 'buffer': 0,
  \ 'nowait': 0,
  \ 'silent': 1,
  \ 'script': 0,
  \ 'expr'  : 0,
  \ 'unique': 0,
  \ 'mode'  : '',
  \ 'msg'   : '',
  \ 'normal': 0,
  \ 'filetype': v:null,
  \ }

let s:logger = SpaceVim#logger#derive('myspace:api:keymap')

"FUNCTION: g:api#keymap#create_mapping_args(){{{1
function! g:api#keymap#map_space_commands(args) abort
  let argsLength = len(a:args)
  if argsLength == 0
    return
  endif

  if type(a:args[0]) == v:t_list
    let options = get(a:args, 1, {})
    let argsList = a:args[0]
  elseif argsLength >= 2
    let options = get(a:args, 2, {})
    let argsList = [[a:args[0], a:args[1]]]
  endif

  for mapArgs in argsList
    let commandOptions = extend({}, get(mapArgs, 2, {}), options)
    call s:map_space_command(mapArgs[0], mapArgs[1], commandOptions)
  endfor
endfunction

function! s:map_space_command(key, command) abort
  let key = a:1
  let commands = a:2
  let options = a:0 == 3 ? a:3 : {}
" SpaceVim#mapping#def

endfunction

function! g:api#keymap#create_mapping_arg() abort
endfunction

function! s:create_mapping_arg() abort
endfunction
"}}}

"FUNCTION: api#keymap#map_normal_commands(commands){{{1
function! g:api#keymap#map_normal_commands(...)
  call s:map_commands('s:normal_map', a:000)
endfunction

function! s:normal_map(key, commands, commandFragments, options)
  return 'n'.s:map(a:key, a:commands, a:commandFragments, a:options)
endfunction
"}}}

"FUNCTION: api#keymap#map_insert_commands(key, commands, options){{{1
function! g:api#keymap#map_insert_commands(...)
  call s:map_commands('s:insert_map', a:000)
endfunction

function! s:insert_map(key, commands, commandFragments, options)
  return 'i'.s:map(a:key, a:commands, a:commandFragments, a:options)
endfunction
"}}}

"FUNCTION: api#keymap#map_visual_commands(key, commands, options){{{1
function! g:api#keymap#map_visual_commands(...)
  call s:map_commands('s:visual_map', a:000)
endfunction

function! s:visual_map(key, commands, commandFragments, options)
  return 'v'.s:map(a:key, a:commands, a:commandFragments, a:options)
endfunction
"}}}

"FUNCTION: api#keymap#map_commands(key, commands, options){{{1
function! g:api#keymap#map_commands(...)
  call s:map_commands('s:map', a:000)
endfunction
"}}}

"FUNCTION: s:is_command_line_command(command){{{1
function! s:is_command_line_command(command)
  return strpart(a:command, 0, 1) == ':'
endfunction
"}}}

"FUNCTION: s:keymap(){{{1
function! s:keymap(...)
  let MapGenerator = function(a:1)
  let key = a:2
  let commands = a:3
  let options = a:0 == 4 ? a:4 : {}
  let debug = get(options, 'debug', api#utils#is_debug())

  " TODO: supoort filetype?
  "if has(options, 'filetype')
  "endif

  let commandFragment = {
        \ 'nore': get(options, 'nore', s:option_default.nore) ? 'nore' : '',
        \ 'silent': get(options, 'silent', s:option_default.silent) ? '<silent> ' : '',
        \ 'buffer': get(options, 'buffer', s:option_default.buffer) ? '<buffer> ' : '',
        \ 'expr': get(options, 'expr', 0) ? '<expr> ' : '',
        \ 'nowait': get(options, 'nowait', 0) ? '<nowait> ' : '',
        \}

  let commands = !s:is_command_line_command(commands) && get(options, 'normal', s:option_default.normal)
        \               ? ':exec "normal! '.commands.'"<cr>'
        \               : commands

  let mapCommand = MapGenerator(key, commands, commandFragment, options)

  if debug
    call s:logger.info('generate map command: '.mapCommand)
  endif

  exec mapCommand
endfunction
"}}}

"FUNCTION: s:map_commands(mapGeneratorName, args){{{1
function! s:map_commands(mapGeneratorName, args)
  let argsLength = len(a:args)
  if argsLength == 0
    return
  endif

  if type(a:args[0]) == v:t_list
    let options = argsLength == 2 ? a:args[1] : {}
    for mapArgs in a:args[0]
      let new = {}
      let commandOptions = len(mapArgs) == 3 ? extend(new, options, mapArgs[2]) : options
      call s:keymap(a:mapGeneratorName, mapArgs[0], mapArgs[1], commandOptions)
    endfor
  elseif argsLength >= 2
    let key = a:args[0]
    let command = a:args[1]
    let options = argsLength == 3 ? a:args[2] : {}
    call s:keymap(a:mapGeneratorName, key, command, options)
  endif
endfunction
"}}}

"FUNCTION: s:map(key, commands, commandFragments, options){{{1
function! s:map(key, commands, commandFragments, options)
  let nore = a:commandFragments.nore
  let silent = a:commandFragments.silent
  let buffer = a:commandFragments.buffer
  let expr = a:commandFragments.expr
  let nowait = a:commandFragments.nowait
  return nore.'map '.silent.buffer.expr.nowait.a:key.' '.a:commands
endfunction
"}}}

" vim: set fdm=marker :
