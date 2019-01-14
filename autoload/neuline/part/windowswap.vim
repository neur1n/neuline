scriptencoding utf-8

function! neuline#part#windowswap#_() abort
  if exists('g:loaded_windowswap')
    return WindowSwap#IsCurrentWindowMarked() ? '' : ''
  else
    return ''
  endif
endfunction
