scriptencoding utf-8

let s:plt = neuline#palette#Get()

"********************************************************************** Main{{{
function! neuline#tal#highlight#Init() abort
  call s:HiStatic()
endfunction

function! neuline#tal#highlight#Link(...) abort
endfunction
"}}}

"**************************************************************** Definition{{{
function! s:HiStatic() abort
    if !exists('g:neuline.tal.definition.logo')
      call neuline#palette#Highlight('NTlogo', s:plt.bgh, s:plt.grays)
    endif

    if !exists('g:neuline.tal.definition.bufinfo')
      call neuline#palette#Highlight('NTbufinfo', s:plt.bgh, s:plt.grays)
    endif

    if !exists('g:neuline.tal.definition.ctab')
      call neuline#palette#Highlight('NTctab', s:plt.orange, s:plt.grays, 'bold')
    endif

    if !exists('g:neuline.tal.definition.nctab')
      call neuline#palette#Highlight('NTnctab', s:plt.bgh, s:plt.grays)
    endif

    if !exists('g:neuline.tal.definition.button')
      call neuline#palette#Highlight('NTbutton', s:plt.bgh, s:plt.grays, 'bold')
    endif
endfunction
"}}}
