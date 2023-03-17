let s:Keymap = g:VIMRC.Keymap

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

call s:Keymap.mapNormalCommands([
      \ [ '<leader>ll', ':Limelight!!<cr>'],
      \], { 'silent': 0 })

let g:limelight_priority = -1
