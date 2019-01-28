scriptencoding utf-8

try
  let s:plt = neutil#palette#Palette()
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
    highlight link NTneurun NTbufinfo
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
  call neutil#palette#Highlight('NTlogo', s:plt.green, s:plt.bgh, 'bold')
  call neutil#palette#Highlight('NTbufinfo', s:plt.fgm, s:plt.bgh, 'bold')
  call neutil#palette#Highlight('NTctab', s:plt.orange, s:plt.bgh, 'bold')
  call neutil#palette#Highlight('NTntab', s:plt.blue, s:plt.bgh, 'bold')
  call neutil#palette#Highlight('NTbutton', s:plt.red, s:plt.bgh, 'bold')
endfunction
"}}}
