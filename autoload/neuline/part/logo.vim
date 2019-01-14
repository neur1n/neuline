scriptencoding utf-8

try
  let s:glyph = neutil#glyph#Get('all')
catch /^Vim\%((\a\+)\)\=:E/
  echohl WarningMsg
  echom 'Please install neutil.'
  echohl NONE
  finish
endtry

function! neuline#part#logo#_(sty) abort
  if a:sty ==# 'sys'
    return s:System()
  elseif a:sty ==# 'vim'
    return s:Vim()
  endif
endfunction

function! s:System() abort
  if has('mac')
    return s:glyph.mac[0]
  elseif has('unix')
    return s:glyph.linux[0]
  elseif has('win32')
    return s:glyph.win[0]
  endif
endfunction

function! s:Vim() abort
  return s:glyph.vim[0]
endfunction
