let s:Keymap = g:VIMRC.Keymap
let g:test#strategy = 'dispatch'

call s:Keymap.mapNormalCommands([
  \ [ 't<c-n>', ':TestNearest<cr>' ],
  \ [ 't<c-f>', ':TestFile<cr>' ],
  \ [ 't<c-s>', ':TestSuite<cr>' ],
  \ [ 't<c-l>', ':TestLast<cr>' ],
  \ [ 't<c-g>', ':TestVisit<cr>' ],
\])

