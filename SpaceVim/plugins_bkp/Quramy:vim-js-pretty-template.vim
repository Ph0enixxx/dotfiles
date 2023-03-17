"call jspretmpl#register_tag('gql', 'graphql')

if exists('JsPreTmpl')
  autocmd FileType javascript JsPreTmpl
  autocmd FileType javascript.jsx JsPreTmpl
  autocmd FileType typescript JsPreTmpl
  autocmd FileType typescript.tsx JsPreTmpl
  autocmd FileType typescript syn clear foldBraces
endif
