let s:Keymap = g:VIMRC.Keymap

set tags=./javascript_tags;/
set tags+=./python_tags;/
set tags+=./ruby_tags;/
set tags+=./go_tags;/
set tags+=./java_tags;/
set tags+=./c_tags;/

call s:Keymap.mapNormalCommands([
      \ [ '<leader>cq', ':CodeQueryMenu Unite Full<cr>'],
      \], { 'silent': 0, 'buffer': 1, 'nore': 0 })
