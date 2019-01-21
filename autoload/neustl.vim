scriptencoding utf-8

let s:save_cpo = &cpoptions
set cpoptions&vim

function! neustl#Update() abort
  let l:winnr = winnr()
  let l:line = (winnr('$') == 1) ? [neuline#stl#init#Construct('active')] :
        \ [neuline#stl#init#Construct('active'), neuline#stl#init#Construct('inactive')]
  for nr in range(1, winnr('$'))
    call setwinvar(nr, '&statusline', l:line[nr!=l:winnr])
    call setwinvar(nr, 'neustl', nr!=l:winnr)
  endfor
endfunction

function! neustl#UpdateOnce() abort
  if !exists('w:neustl') || w:neustl
    call neustl#Update()
  endif
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
