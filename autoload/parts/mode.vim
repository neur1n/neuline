scriptencoding utf-8

let s:mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'no'  : 'NO',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'VL',
    \ '' : 'VB',
    \ 'r'  : 'PROMPT',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ 't': 'TERMINAL',
\ }

function! parts#mode#mode() abort
    if &filetype ==# 'help'
        let l:mode = 'HELP'
    " elseif &filetype ==# 'qf'
    "     let l:mode = 'quickfix'
    elseif &filetype ==# 'startify'
        let l:mode = 'STARTIFY'
    elseif &filetype ==# 'vim-plug'
        let l:mode = 'VIM-PLUG'
    else
        let l:mode = get(s:mode_map, mode(), mode())
    endif

    let l:mode .= &paste ? '|PASTE' : ''
    let l:mode .= &spell ? '|SPELL' : ''

    return '#ZMode# '.l:mode.' '
endfunction
