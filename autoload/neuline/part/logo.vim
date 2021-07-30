scriptencoding utf-8

let s:logo = {
      \ 'linux':    ["\uf17c", ''],
      \ 'mac':      ["\ue711", ''],
      \ 'vim':      ["\ue7c5", ''],
      \ 'win':      ["\uf17a", '']
      \ }

function! neuline#part#logo#_(sty) abort
  if a:sty ==# 'sys'
    return s:System()
  elseif a:sty ==# 'vim'
    return s:Vim()
  endif
endfunction

function! s:System() abort
  if has('mac')
    return s:logo.mac[0]
  elseif has('unix')
    return s:logo.linux[0]
  elseif has('win32')
    return s:logo.win[0]
  endif
endfunction

function! s:Vim() abort
  return s:logo.vim[0]
endfunction
