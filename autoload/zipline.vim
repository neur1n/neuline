scriptencoding utf-8

let s:save_cpo = &cpoptions
set cpoptions&vim

let s:startup = 1

function! zipline#update() abort
  if s:startup
    call s:construct('active')
    call parts#highlight#update('s')
    call parts#highlight#update('n')
    let s:startup = 0
  endif

  let l:winnr = winnr()
  let l:line = (winnr('$') == 1) ? [s:construct('active')] :
        \ [s:construct('active'), s:construct('inactive')]
  for l:w in range(1, winnr('$'))
    call setwinvar(l:w, '&statusline', l:line[l:w!=l:winnr])
    call setwinvar(l:w, 'layout_changed', l:w!=l:winnr)
    call setwinvar(l:w, 'inactive', l:w!=l:winnr)
  endfor
endfunction

function! zipline#update_once() abort
  if !exists('w:layout_changed') || w:layout_changed
    call zipline#update()
  endif
endfunction

function! s:construct(status) abort
  return s:left_part(a:status).'%=%='.s:right_part(a:status).
        \ '%{zipline#update_color()}'
endfunction

function! s:left_part(status) abort
  if a:status ==# 'active'
    return parts#mode#mode()
          \ .parts#vcs#branch()
          \ .parts#bufinfo#status(' ', 'num', ':', 'name')
          \ .parts#modification#status()
          \ .parts#windowswap#status()
  elseif a:status ==# 'inactive'
    return parts#bufinfo#status(' ', 'num', ':', 'name')
          \ .parts#modification#status()
          \ .parts#windowswap#status()
  endif
endfunction

function! s:right_part(status) abort
  if a:status ==# 'active'
    return parts#tagbar#tag('%s', '', '%f').'%<'
          \ .parts#fileinfo#status()
          \ .parts#ruler#status(4, -3)
          \ .parts#whitespace#next()
          \ .parts#lintinfo#status()
  elseif a:status ==# 'inactive'
    return parts#ruler#status(4, -3)
  endif
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
