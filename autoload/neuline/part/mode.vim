scriptencoding utf-8

function! neuline#part#mode#_() abort
  if &filetype ==# 'help'
    let l:mode = 'HELP'
  elseif &filetype ==# 'startify'
    let l:mode = 'STARTIFY'
  elseif &filetype ==# 'vim-plug'
    let l:mode = 'VIM-PLUG'
  else
    let l:mode = get(g:neu.stl.mode_map, mode(), '?')
  endif

  let l:mode .= &paste ? '|PASTE' : ''
  let l:mode .= &spell ? '|SPELL' : ''

  return l:mode
endfunction
