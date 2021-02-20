scriptencoding utf-8

try
  let s:plt = neutil#palette#Palette()
catch /^Vim\%((\a\+)\)\=:E/
  finish
endtry

"********************************************************************** Main{{{
function! neuline#tal#highlight#Init() abort
  call s:HiStatic()
endfunction

function! neuline#tal#highlight#Link(...) abort
endfunction
"}}}

"**************************************************************** Definition{{{
function! s:HiStatic() abort
  if exists('g:neuline.tal.definition')
    if exists('g:neuline.tal.definition.logo')
      call neutil#palette#Highlight('NTlogo', s:plt.bgh, s:plt.grays)
    endif

    if exists('g:neuline.tal.definition.bufinfo')
      call neutil#palette#Highlight('NTbufinfo', s:plt.bgh, s:plt.grays)
    endif

    if exists('g:neuline.tal.definition.ctab')
      call neutil#palette#Highlight('NTctab', s:plt.orange, s:plt.grays, 'bold')
    endif

    if exists('g:neuline.tal.definition.nctab')
      call neutil#palette#Highlight('NTnctab', s:plt.bgh, s:plt.grays)
    endif

    if exists('g:neuline.tal.definition.button')
      call neutil#palette#Highlight('NTbutton', s:plt.bgh, s:plt.grays, 'bold')
    endif
  endif
endfunction
"}}}
