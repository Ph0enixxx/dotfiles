" -----------------------------------------------------------------------------
" SETTINGS - ruanyl/vim-fixmyjs
" --------------- --------------------------------------------------------------
let s:Keymap = g:VIMRC.Keymap

let g:fixmyjs_engine = 'eslint'
let g:fixmyjs_rc_filename = ['.eslintrc', '.eslintrc.json']
let g:fixmyjs_rc_local = 1
let g:fixmyjs_use_local = 1

call s:Keymap.mapNormalCommands([
  \ ['<leader><leader>f', ':Fixmyjs<CR>'],
  \], { 'silent': 0 })
