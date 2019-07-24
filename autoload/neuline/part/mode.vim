scriptencoding utf-8

function! neuline#part#mode#_() abort
  let l:mode_map = s:ModeMap()

  if &filetype ==# 'help'
    let l:mode = 'HELP'
  elseif &filetype ==# 'startify'
    let l:mode = 'STARTIFY'
  elseif &filetype ==# 'vim-plug'
    let l:mode = 'VIM-PLUG'
  else
    let l:mode = get(l:mode_map, mode(), '?')
  endif

  let l:mode .= &paste ? '|PASTE' : ''
  let l:mode .= &spell ? '|SPELL' : ''

  return l:mode
endfunction

function! s:ModeMap() abort
  if !exists('g:neuline.mode_map')
    let l:mode_map = {
          \ 'n':  'N',
          \ 'no': 'NO',
          \ 'i':  'I',
          \ 'v':  'V',
          \ 'V':  'VL',
          \ '': 'VB',
          \ 'R':  'R',
          \ 'r':  'PROMPT',
          \ 'c':  'C',
          \ 't':  'TERMINAL',
          \ 's':  'S',
          \ 'S':  'S',
          \ '': 'S',
          \ '__': '-',
          \ '?':  'UNKNOWN',
          \ }
    return l:mode_map
  else
    return g:neuline.mode_map
  endif
endfunction
