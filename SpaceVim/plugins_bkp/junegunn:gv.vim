let s:Keymap = g:VIMRC.Keymap

if exists(':GV')
  call s:Keymap.mapNormalCommands([
        \ [ '<leader>gv', ':GV<cr>'],
        \ [ '<leader>gv1', ':GV!<cr>'],
        \ [ '<leader>gv2', ':GV?<cr>'],
        \], { 'silent': 0 })
endif

