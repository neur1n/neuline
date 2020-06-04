scriptencoding utf-8

try
  let s:plt = neutil#palette#Palette()
catch /^Vim\%((\a\+)\)\=:E/
  finish
endtry

let s:color_map = {
      \ 'N': [s:plt.green, s:plt.cyan],
      \ 'I': [s:plt.cyan, s:plt.blue],
      \ 'V': [s:plt.yellow, s:plt.orange],
      \ 'R': [s:plt.purple, s:plt.blue],
      \ 'C': [s:plt.red, s:plt.cyan],
      \ }

let s:link_map = {
      \ 'n':  'N',
      \ 'no': 'N',
      \ 'i':  'I',
      \ 'v':  'V',
      \ 'V':  'V',
      \ '': 'V',
      \ 'R':  'R',
      \ 'r':  'R',
      \ 'c':  'C',
      \ 't':  'C',
      \ }

let s:prev_mode = ''

"********************************************************************** Main{{{
function! neuline#stl#highlight#Init() abort
  call s:HiStatic()
  call s:HiDynamic('N')
  call s:HiDynamic('I')
  call s:HiDynamic('V')
  call s:HiDynamic('R')
  call s:HiDynamic('C')
endfunction

function! neuline#stl#highlight#Link(...) abort
  for w in range(1, winnr('$'))
    if w == winnr()
      let l:mode = get(s:link_map, a:0 ? a:1 : mode(), 'n')
      if l:mode == s:prev_mode
        return ''
      endif
      let s:prev_mode = l:mode

      execute 'highlight link NSmode NSmode'.l:mode
      execute 'highlight link NSbufinfo NSbufinfo'.l:mode
      execute 'highlight link NSmodif NSmodif'.l:mode
      execute 'highlight link NSruler NSruler'.l:mode
    endif
  endfor
  return ''
endfunction
"}}}

"**************************************************************** Definition{{{
function! s:HiStatic() abort
  " Inactive mode and file info.
  call neutil#palette#Highlight('NSbufinfoIN', s:plt.fgm, s:plt.grays)
  call neutil#palette#Highlight('NSmodifIN', s:plt.purple, s:plt.grays)
  call neutil#palette#Highlight('NSrulerIN', s:plt.fgm, s:plt.grays)

  call neutil#palette#Highlight('NSfileinfo', s:plt.bgh, s:plt.graym)
endfunction

function! s:HiDynamic(mode) abort
  call neutil#palette#Highlight('NSmode'.a:mode, s:plt.bgh, s:color_map[a:mode][0])
  call neutil#palette#Highlight('NSbufinfo'.a:mode, s:plt.bgh, s:color_map[a:mode][1])
  call neutil#palette#Highlight('NSmodif'.a:mode, s:plt.red, s:plt.bgh)
  call neutil#palette#Highlight('NSruler'.a:mode, s:plt.bgh, s:color_map[a:mode][0])
endfunction
"}}}
