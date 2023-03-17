let s:map_options = { 'buffer': 1, 'nore': 1, 'normal': 1, 'silent': 0 }

call api#keymap#map_normal_commands([
  \   ['q', ':q<cr>'],
  \ ], { 'buffer': 1, 'nore': 1, 'normal': 1 })

call api#keymap#map_normal_commands([
  \   ['<f1>', ':h '],
  \ ], { 'buffer': 1, 'nore': 1, 'normal': 1, 'silent': 0 })
