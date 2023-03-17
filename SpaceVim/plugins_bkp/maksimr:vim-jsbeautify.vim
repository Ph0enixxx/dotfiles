let s:Keymap = g:VIMRC.Keymap

" Keymap
call s:Keymap.mapNormalCommands('<c-f>', ':call JsBeautify()<cr>')
call s:Keymap.mapInsertCommands('<c-f>', ':call JsBeautify()<cr>')

let s:jsbeautify_map_options = { 'buffer': 1, 'normal': 0 }

augroup maksimr_jsbeautify
  autocmd!
  autocmd FileType javascript call s:Keymap.mapNormalCommands('<c-f>', ':call JsBeautify()<cr>', s:jsbeautify_map_options)
  autocmd FileType javascript call s:Keymap.mapInsertCommands('<c-f>', ':call JsBeautify()<cr>', s:jsbeautify_map_options)
  autocmd FileType javascript call s:Keymap.mapVisualCommands('<c-f>', ':call RangeJsBeautify()<cr>', s:jsbeautify_map_options)

  autocmd FileType json call s:Keymap.mapNormalCommands('<c-f>', ':call JsonBeautify()<cr>', s:jsbeautify_map_options)
  autocmd FileType json call s:Keymap.mapInsertCommands('<c-f>', ':call JsonBeautify()<cr>', s:jsbeautify_map_options)
  autocmd FileType json call s:Keymap.mapVisualCommands('<c-f>', ':call RangeJsonBeautify()<cr>', s:jsbeautify_map_options)

  autocmd FileType jsx call s:Keymap.mapNormalCommands('<c-f>', ':call JsxBeautify()<cr>', s:jsbeautify_map_options)
  autocmd FileType jsx call s:Keymap.mapInsertCommands('<c-f>', ':call JsxBeautify()<cr>', s:jsbeautify_map_options)
  autocmd FileType jsx call s:Keymap.mapVisualCommands('<c-f>', ':call RangeJsxBeautify()<cr>', s:jsbeautify_map_options);

  autocmd FileType html call s:Keymap.mapNormalCommands('<c-f>', ':call HtmlBeautify()<cr>', s:jsbeautify_map_options)
  autocmd FileType html call s:Keymap.mapInsertCommands('<c-f>', ':call HtmlBeautify()<cr>', s:jsbeautify_map_options)
  autocmd FileType html call s:Keymap.mapVisualCommands('<c-f>', ':call RangeHtmlBeautify()<cr>', s:jsbeautify_map_options)

  autocmd FileType css call s:Keymap.mapNormalCommands('<c-f>', ':call CSSBeautify()<cr>', s:jsbeautify_map_options)
  autocmd FileType css call s:Keymap.mapInsertCommands('<c-f>', ':call CSSBeautify()<cr>', s:jsbeautify_map_options)
  autocmd FileType css call s:Keymap.mapVisualCommands('<c-f>', ':call RangeCSSBeautify()<cr>', s:jsbeautify_map_options)
augroup END

