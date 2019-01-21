scriptencoding utf-8

function! neuline#tal#init#Construct() abort
  return s:LeftPart().'%=%<'.s:RightPart()
endfunction

function! s:LeftPart() abort
  let l:left = ''

  for s in g:neu.tal.left
    let l:left .= neuline#section#Create(
          \ 1, g:neu.tal.section[s][0], g:neu.tal.section[s][1])
  endfor

  return l:left
endfunction

function! s:RightPart() abort
  let l:right = ''

  for s in g:neu.tal.right
    let l:right .= neuline#section#Create(
          \ 1, g:neu.tal.section[s][0], g:neu.tal.section[s][1])
  endfor

  return l:right
endfunction
