scriptencoding utf-8

function! parts#windowswap#status() abort
  if exists('g:loaded_windowswap')
    return '%#ZSwap#%{WindowSwap#IsCurrentWindowMarked() ? "WS" : ""}'
  else
    return ''
  endif
endfunction
