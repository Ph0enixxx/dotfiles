let g:bufExplorerShowNoName=1
let g:bufExplorerShowRssativePath=1
let g:bufExplorerSortBy='mru'
let g:bufExplorerShowRelativePath=1

let s:map_options = { 'nore': 1, 'normal': 1 }
call api#keymap#map_normal_commands(
    \ [
    \   [ '<S-F4>', ':BufExplorerHorizontalSplit<cr>' ],
    \ ], s:map_options)
    " \   [ '<F4>', ':ToggleBufExplorer<cr>' ],

