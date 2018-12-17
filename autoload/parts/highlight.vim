scriptencoding utf-8

let s:palette = assets#palette#Palette()
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

function! parts#highlight#Link(...) abort
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

function! parts#highlight#Cache() abort
  call s:HiStatic()
  call s:HiDynamic('N')
  call s:HiDynamic('I')
  call s:HiDynamic('V')
  call s:HiDynamic('R')
  call s:HiDynamic('C')
endfunction

function! s:HiStatic() abort
  " Tabline
  " call s:Highlight('ZTLeft',
  "       \ s:palette.T_fg[0], s:palette.T_bg[0],
  "       \ s:palette.T_fg[1], s:palette.T_bg[1], 'bold')
  " call s:Highlight('ZCTab',
  "       \ s:palette.T_fg[0], s:palette.T_bg[0],
  "       \ s:palette.T_fg[1], s:palette.T_bg[1], 'bold')
  call s:Highlight('ZTLeft',
        \ s:palette.T_left[0], 'bg',
        \ s:palette.T_left[1], 'bg', 'bold')
  call s:Highlight('ZCTab',
        \ s:palette.T_right[0], 'bg',
        \ s:palette.T_right[1], 'bg', 'bold')
  execute 'highlight link ZNCTab ZTLeft'

  " Inactive mode and file info.
  " call s:Highlight('ZModeU',
  "       \ s:palette.U_mode[0], s:palette.H_bg[0],
  "       \ s:palette.U_mode[1], s:palette.H_bg[1], 'bold')
  call s:Highlight('ZBufInfoU',
        \ s:palette.U_name[0], s:palette.H_bg[0],
        \ s:palette.U_name[1], s:palette.H_bg[1], 'bold')
  call s:Highlight('ZModifU',
        \ s:palette.U_modi[0], s:palette.H_bg[0],
        \ s:palette.U_modi[1], s:palette.H_bg[1], 'bold')
  call s:Highlight('ZRulerU',
        \ s:palette.U_ruler[0], s:palette.H_bg[0],
        \ s:palette.U_ruler[1], s:palette.H_bg[1], 'NONE')

  call s:Highlight('ZFileInfo',
        \ s:palette.S_info[0], s:palette.H_bg[0],
        \ s:palette.S_info[1], s:palette.H_bg[1], 'NONE')

  " Plugin dependent.
  if exists('g:loaded_gitbranch')
    call s:Highlight('ZVCS',
          \ s:palette.S_vcs[0], s:palette.H_bg[0],
          \ s:palette.S_vcs[1], s:palette.H_bg[1], 'bold')
  endif
  if exists('g:loaded_windowswap')
    call s:Highlight('ZSwap',
          \ s:palette.S_swap[0], s:palette.H_bg[0],
          \ s:palette.S_swap[1], s:palette.H_bg[1], 'bold')
  endif
  if exists(':Tagbar')
    call s:Highlight('ZTag',
          \ s:palette.S_tag[0], s:palette.H_bg[0],
          \ s:palette.S_tag[1], s:palette.H_bg[1], 'italic')
  endif

  if exists('g:loaded_neomake') || exists('g:loaded_ale') || exists('g:did_coc_loaded')
    call s:Highlight('ZWarning',
          \ s:palette.S_warn[0], s:palette.H_bg[0],
          \ s:palette.S_warn[1], s:palette.H_bg[1], 'bold')
    call s:Highlight('ZError',
          \ s:palette.S_err[0], s:palette.H_bg[0],
          \ s:palette.S_err[1], s:palette.H_bg[1], 'bold')
    " call s:Highlight('ZWarning',
    "       \ s:palette.H_bg[0], s:palette.S_warn[0],
    "       \ s:palette.H_bg[1], s:palette.S_warn[1], 'bold')
    " call s:Highlight('ZError',
    "       \ s:palette.H_bg[0], s:palette.S_err[0],
    "       \ s:palette.H_bg[1], s:palette.S_err[1], 'bold')
  endif
endfunction

let s:cnt = 0
function! s:HiDynamic(mode) abort
  call s:Highlight('ZMode'.a:mode,
        \ s:palette.H_bg[0], eval(printf('s:palette.%s_mode[0]', a:mode)),
        \ s:palette.H_bg[1], eval(printf('s:palette.%s_mode[1]', a:mode)),
        \ 'bold')
  call s:Highlight('ZBufInfo'.a:mode,
        \ eval(printf('s:palette.%s_name[0]', a:mode)), s:palette.H_bg[0],
        \ eval(printf('s:palette.%s_name[1]', a:mode)), s:palette.H_bg[1],
        \ 'bold')
  call s:Highlight('ZModif'.a:mode,
        \ eval(printf('s:palette.%s_modi[0]', a:mode)), s:palette.H_bg[0],
        \ eval(printf('s:palette.%s_modi[1]', a:mode)), s:palette.H_bg[1],
        \ 'bold')
  call s:Highlight('ZRuler'.a:mode,
        \ eval(printf('s:palette.%s_ruler[0]', a:mode)), s:palette.H_bg[0],
        \ eval(printf('s:palette.%s_ruler[1]', a:mode)), s:palette.H_bg[1],
        \ 'NONE')
  " call s:Highlight('ZRuler'.a:mode,
  "       \ s:palette.H_bg[0], eval(printf('s:palette.%s_ruler[0]', a:mode)),
  "       \ s:palette.H_bg[1], eval(printf('s:palette.%s_ruler[1]', a:mode)),
  "       \ 'bold')
endfunction

function! s:Highlight(group, guifg, guibg, ctermfg, ctermbg, style) abort
  exec printf('hi %s guifg=%s guibg=%s ctermfg=%s ctermbg=%s gui=%s cterm=%s',
        \ a:group, a:guifg, a:guibg, a:ctermfg, a:ctermbg, a:style, a:style)
endfunction
