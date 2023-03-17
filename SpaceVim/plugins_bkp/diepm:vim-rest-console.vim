let g:vrc_curl_opts = {
  \ '--connect-timeout' : 5,
  \ '-b': '~/.vim/.cookie',
  \ '-c': '~/.vim/.cookie',
  \ '-L': '',
  \ '-i': '',
  \ '--max-time': 60,
  \ '--ipv4': '',
  \ '-k': '',
\}

let g:vrc_split_request_body = 1

let s:Keymap = g:VIMRC.Keymap

call s:Keymap.mapNormalCommands('<F5>', ':new ~/.vim/new.rest<cr>', { 'normal': 0 })

