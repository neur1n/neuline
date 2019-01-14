scriptencoding utf-8

try
  let s:palette = neutil#palette#Palette()
catch /^Vim\%((\a\+)\)\=:E/
  finish
endtry

let s:color_map = {
      \ 'N': [s:palette.green, s:palette.cyan],
      \ 'I': [s:palette.cyan, s:palette.blue],
      \ 'V': [s:palette.yellow, s:palette.orange],
      \ 'R': [s:palette.purple, s:palette.blue],
      \ 'C': [s:palette.red, s:palette.cyan],
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
  call neutil#palette#Highlight('NSbufinfoIN', s:palette.fgh, s:palette.bgh, 'bold')
  call neutil#palette#Highlight('NSmodifIN', s:palette.purple, s:palette.bgh, 'bold')
  call neutil#palette#Highlight('NSrulerIN', s:palette.fgh, s:palette.bgh, 'NONE')

  call neutil#palette#Highlight('NSfileinfo', s:palette.gray, s:palette.bgh, 'NONE')

  " Plugin dependent.
  if exists('g:loaded_gitbranch')
    call neutil#palette#Highlight('NSvcs', s:palette.fgs, s:palette.bgh, 'bold')
  endif
  if exists('g:loaded_windowswap')
    call neutil#palette#Highlight('NSswap', s:palette.orange, s:palette.bgh, 'bold')
    highlight link NSswapIN NSswap
  endif
  if exists(':Tagbar')
    call neutil#palette#Highlight('NStag', s:palette.fgh, s:palette.bgh, 'italic')
  endif

  if exists('g:loaded_neomake') || exists('g:loaded_ale') || exists('g:did_coc_loaded')
    call neutil#palette#Highlight('NSlinti', s:palette.blue, s:palette.bgh, 'bold')
    call neutil#palette#Highlight('NSlinth', s:palette.green, s:palette.bgh, 'bold')
    call neutil#palette#Highlight('NSlintw', s:palette.orange, s:palette.bgh, 'bold')
    call neutil#palette#Highlight('NSlinte', s:palette.red, s:palette.bgh, 'bold')
  endif
endfunction

function! s:HiDynamic(mode) abort
  call neutil#palette#Highlight('NSmode'.a:mode, s:palette.bgh, s:color_map[a:mode][0], 'bold')
  call neutil#palette#Highlight('NSbufinfo'.a:mode, s:color_map[a:mode][1], s:palette.bgh, 'bold')
  call neutil#palette#Highlight('NSmodif'.a:mode, s:palette.red, s:palette.bgh, 'bold')
  call neutil#palette#Highlight('NSruler'.a:mode, s:color_map[a:mode][0], s:palette.bgh, 'NONE')
endfunction
"}}}
