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

call SpaceVim#custom#SPC('nnoremap', ['a', 'r'], ':new ~/.vim/new.rest', 'REST Console', 1)

