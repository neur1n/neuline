scriptencoding utf-8

let g:neuline_palettes = {
      \ 'default': {
        \ 'bgh':    {'c': 234, 'g': '#151d1a'},
        \ 'bgm':    {'c': 235, 'g': '#212224'},
        \ 'bgs':    {'c': 236, 'g': '#30312e'},
        \ 'fgh':    {'c': 252, 'g': '#dad4c4'},
        \ 'fgm':    {'c': 253, 'g': '#e4dbcc'},
        \ 'fgs':    {'c': 254, 'g': '#e5e4df'},
        \ 'grayh':  {'c': 238, 'g': '#3c4041'},
        \ 'graym':  {'c': 239, 'g': '#4e5156'},
        \ 'grays':  {'c': 242, 'g': '#63696a'},
        \ 'red':    {'c': 167, 'g': '#dd6151'},
        \ 'orange': {'c': 214, 'g': '#ffac00'},
        \ 'yellow': {'c': 220, 'g': '#f2c700'},
        \ 'green':  {'c': 107, 'g': '#93c247'},
        \ 'cyan':   {'c':  79, 'g': '#69d0a5'},
        \ 'blue':   {'c':  67, 'g': '#5991ae'},
        \ 'purple': {'c': 175, 'g': '#d37ba2'}
        \ }
      \ }

function! neuline#palette#Add(palette) abort
  for l:pair in items(a:palette)
    let g:neuline_palettes[l:pair[0]] = l:pair[1]
  endfor
endfunction

function! neuline#palette#Get(...) abort
  let l:colorscheme = ''

  if a:0 == 0
    let l:colorscheme = get(g:, 'neuline_colorscheme', 'default')
  else
    if !has_key(g:neuline_palettes, a:1)
      echohl WarningMsg
      echomsg '[neuline] Undefined palette name, default palette will be used.'
      echohl NONE
      let l:colorscheme = 'default'
    else
      let l:colorscheme = a:1
    endif
  endif

  return g:neuline_palettes[l:colorscheme]
endfunction

function! neuline#palette#Highlight(group, fg, ...) abort
  " Arguments: group, fg, bg, sty, sp; fg and bg should be dict or str.
  if type(a:fg) == v:t_dict
    let l:fgc = a:fg.c
    let l:fgg = a:fg.g
  else
    let l:fgc = a:fg
    let l:fgg = a:fg
  endif

  if a:0 >= 1
    if type(a:1) == v:t_dict
      let l:bgc = a:1.c
      let l:bgg = a:1.g
    else
      let l:bgc = a:1
      let l:bgg = a:1
    endif
  else
    let l:bgc = 'NONE'
    let l:bgg = 'NONE'
  endif

  if a:0 >= 2
    let l:sty = a:2
  else
    let l:sty = 'NONE'
  endif

  let l:cmd = ['highlight!', a:group, 'ctermfg='.l:fgc, 'ctermbg='.l:bgc,
        \ 'guifg='.l:fgg, 'guibg='.l:bgg, 'cterm='.l:sty, 'gui='.l:sty]

  if a:0 >= 3
    if type(a:3) == v:t_dict
      let l:sp = a:3.g
    else
      let l:sp = a:3
    endif
    call add(l:cmd, 'guisp='.l:sp)
  endif

  execute join(l:cmd, ' ')
endfunction
