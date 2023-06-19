let credentials = $HOME . '/.cache/calendar.vim/credentials.vim'
if filereadable(credentials)
  source credentials 
endif

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

