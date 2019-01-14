scriptencoding utf-8

function! neuline#stl#init#Construct(status) abort
  return s:LeftPart(a:status).'%='.s:RightPart(a:status)
        \ .'%{neuline#stl#highlight#Link()}'
endfunction

function! s:LeftPart(status) abort
  let l:left = ''

  if a:status ==# 'active'
    for s in g:neu.stl.left.active
      let l:left .= neuline#section#Create(
            \ 1, g:neu.stl.section[s][0], g:neu.stl.section[s][1])
    endfor
  elseif a:status ==# 'inactive'
    for s in g:neu.stl.left.inactive
      let l:left .= neuline#section#Create(
            \ 0, g:neu.stl.section[s][0], g:neu.stl.section[s][1])
    endfor
  endif

  return l:left
endfunction

function! s:RightPart(status) abort
  let l:right = ''

  if a:status ==# 'active'
    for s in g:neu.stl.right.active
      let l:right .= neuline#section#Create(
            \ 1, g:neu.stl.section[s][0], g:neu.stl.section[s][1])
    endfor
  elseif a:status ==# 'inactive'
    for s in g:neu.stl.right.inactive
      let l:right .= neuline#section#Create(
            \ 0, g:neu.stl.section[s][0], g:neu.stl.section[s][1])
    endfor
  endif

  return l:right
endfunction
