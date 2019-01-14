scriptencoding utf-8

" let s:glyph = get(g:, 'neuline.lintsign', {'i': '', 'h': '', 'w': '', 'e': '✘'})
let s:glyph = {'I': '', 'H': '', 'W': '', 'E': '✘'}
let s:type = {'I': 'information', 'H': 'Hint', 'W': 'Warning', 'E': 'Error'}
let s:info = {}
let s:update = 1

"******************************************************************** Counts{{{
function! neuline#part#lintinfo#_(type) abort
  let l:cnt = 0
  if exists('g:loaded_neomake')
    let l:cnt = s:NeomakeInfo(a:type)
  elseif exists('g:did_coc_loaded')
    let l:cnt = s:CocInfo(a:type)
  endif

  if l:cnt > 0
    return s:glyph[a:type].l:cnt
  else
    return ''
  endif
endfunction

function! s:NeomakeInfo(type) abort
  if s:update
    let s:info = neomake#statusline#LoclistCounts()
    let s:update = 0
  endif
  return get(s:info, a:type, 0)
endfunction

function! s:CocInfo(type) abort
  if s:update
    let s:info = get(b:, 'coc_diagnostic_info', {})
    let s:update = 0
  endif

  if !empty(s:info)
    return s:info[s:type[a:type]]
  else
    return 0
  endif
endfunction
"}}}

"******************************************************************** Update{{{
function! neuline#part#lintinfo#Update() abort
  let s:update = 1
endfunction
"}}}

"********************************************************************** Jump{{{
function! neuline#part#lintinfo#Jump(direction) abort
  if a:direction ==# 'prev'
    try
      silent execute 'lprevious'
    catch /^Vim\%((\a\+)\)\=:E/
      try
        silent execute 'llast'
      endtry
    endtry
  elseif a:direction ==# 'next'
    try
      silent execute 'lnext'
    catch /^Vim\%((\a\+)\)\=:E/
      try
        silent execute 'lfirst'
      endtry
    endtry
  endif
endfunction
"}}}
