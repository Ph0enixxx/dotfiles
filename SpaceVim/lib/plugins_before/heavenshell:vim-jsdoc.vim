let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_access_descriptions = 1
let g:jsdoc_underscore_private = 1
let g:jsdoc_custom_args_regex_only = 1
let g:jsdoc_custom_args_hook = {
      \   '^\$': {
      \     'type': '{jQuery}'
      \   },
      \   'callback': {
      \     'type': '{Function}',
      \     'description': 'Callback function'
      \   },
      \   'data': {
      \     'type': '{Object}'
      \   },
      \   '^e$': {
      \     'type': '{Event}'
      \   },
      \   '^event$': {
      \     'type': '{Event}'
      \   },
      \   'el$': {
      \     'type': '{Element}'
      \   },
      \   '\(err\|error\)$': {
      \     'type': '{Error}'
      \   },
      \   'handler$': {
      \     'type': '{Function}'
      \   },
      \   '^i$': {
      \     'type': '{Number}'
      \   },
      \   '^_\?is': {
      \     'type': '{Boolean}'
      \   },
      \   'options$': {
      \     'type': '{Object}'
      \   },
      \ }
let g:jsdoc_enable_es6 = 1

" call s:Keymap.mapNormalCommands('<D-d>', ':JsDoc<cr>', { 'normal': 0 })
