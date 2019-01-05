scriptencoding utf-8

let s:prev_mode = ''
let s:startup = 1
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

"**************************************************************** {{{Definition
let s:palette = neur1n#palette#Palette()
let s:color_map = {
      \ 'N': [s:palette.green, s:palette.cyan],
      \ 'I': [s:palette.cyan, s:palette.blue],
      \ 'V': [s:palette.yellow, s:palette.orange],
      \ 'R': [s:palette.purple, s:palette.blue],
      \ 'C': [s:palette.red, s:palette.cyan],
      \ }

function! s:HiStatic() abort
  " Tabline
  call neur1n#palette#Highlight('ZTLeft', s:palette.blue, 'bg', 'bold')
  call neur1n#palette#Highlight('ZTCurTab', s:palette.orange, 'bg', 'bold')
  execute 'highlight link ZTNotCurTab ZTLeft'

  " Inactive mode and file info.
  call neur1n#palette#Highlight('ZBufInfoU', s:palette.fg_h, s:palette.bg_h, 'bold')
  call neur1n#palette#Highlight('ZModifU', s:palette.purple, s:palette.bg_h, 'bold')
  call neur1n#palette#Highlight('ZRulerU', s:palette.fg_h, s:palette.bg_h, 'NONE')

  call neur1n#palette#Highlight('ZFileInfo', s:palette.gray, s:palette.bg_h, 'NONE')

  " Plugin dependent.
  if exists('g:loaded_gitbranch')
    call neur1n#palette#Highlight('ZVCS', s:palette.fg_s, s:palette.bg_h, 'bold')
  endif
  if exists('g:loaded_windowswap')
    call neur1n#palette#Highlight('ZSwap', s:palette.orange, s:palette.bg_h, 'bold')
  endif
  if exists(':Tagbar')
    call neur1n#palette#Highlight('ZTag', s:palette.fg_h, s:palette.bg_h, 'italic')
  endif

  if exists('g:loaded_neomake') || exists('g:loaded_ale') || exists('g:did_coc_loaded')
    call neur1n#palette#Highlight('ZWarning', s:palette.orange, s:palette.bg_h, 'bold')
    call neur1n#palette#Highlight('ZError', s:palette.red, s:palette.bg_h, 'bold')
  endif
endfunction

function! s:HiDynamic(mode) abort
  call neur1n#palette#Highlight('ZMode'.a:mode, s:palette.bg_h, s:color_map[a:mode][0], 'bold')
  call neur1n#palette#Highlight('ZBufInfo'.a:mode, s:color_map[a:mode][1], s:palette.bg_h, 'bold')
  call neur1n#palette#Highlight('ZModif'.a:mode, s:palette.red, s:palette.bg_h, 'bold')
  call neur1n#palette#Highlight('ZRuler'.a:mode, s:color_map[a:mode][0], s:palette.bg_h, 'NONE')
endfunction
" }}}

"********************************************************************** {{{Main
function! parts#highlight#Link(...) abort
  if s:startup
    call s:HiStatic()
    call s:HiDynamic('N')
    call s:HiDynamic('I')
    call s:HiDynamic('V')
    call s:HiDynamic('R')
    call s:HiDynamic('C')
    let s:startup = 0
  endif

  for w in range(1, winnr('$'))
    " if exists('w:inactive') && w:inactive == 1
    if w == winnr()
      let l:mode = get(s:link_map, a:0 ? a:1 : mode(), 'n')
      if l:mode == s:prev_mode
        return ''
      endif
      let s:prev_mode = l:mode

      execute 'highlight link ZMode ZMode'.l:mode
      execute 'highlight link ZBufInfo ZBufInfo'.l:mode
      execute 'highlight link ZModif ZModif'.l:mode
      execute 'highlight link ZRuler ZRuler'.l:mode
    endif
  endfor
  return ''
endfunction
" }}}
