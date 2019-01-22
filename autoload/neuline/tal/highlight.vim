scriptencoding utf-8

try
  let s:palette = neutil#palette#Palette()
catch /^Vim\%((\a\+)\)\=:E/
  finish
endtry

if exists('g:loaded_neurun')
  let s:link_map = {'i': 'info', 'h': 'hint', 'w': 'warning', 'e': 'error'}
endif

"********************************************************************** Main{{{
function! neuline#tal#highlight#Init() abort
  call s:HiStatic()

  if exists('g:loaded_neurun')
    highlight link NTneurun NONE
  endif
endfunction

function! neuline#tal#highlight#Link(...) abort
  if exists('g:loaded_neurun')
    call neurun#highlight#Link('NTneurun')
  endif
endfunction
"}}}

"**************************************************************** Definition{{{
function! s:HiStatic() abort
  call neutil#palette#Highlight('NTlogo', s:palette.green, s:palette.bgh, 'bold')
  call neutil#palette#Highlight('NTbufinfo', s:palette.fgm, s:palette.bgh, 'bold')
  call neutil#palette#Highlight('NTctab', s:palette.orange, s:palette.bgh, 'bold')
  call neutil#palette#Highlight('NTntab', s:palette.blue, s:palette.bgh, 'bold')
  call neutil#palette#Highlight('NTbutton', s:palette.red, s:palette.bgh, 'bold')
endfunction
"}}}
