scriptencoding utf-8

function! neuline#stl#default#Init() abort
  if !exists('g:neu')
    let g:neu = {}
  endif
  if !exists('g:neu.stl')
    let g:neu.stl = {}
  endif

  if get(g:neu.stl, 'enable', 1)
    set laststatus=2
  endif

  if !get(g:neu.stl, 'faster', 0)
    call s:SetLeftPart()
    call s:SetRightPart()
  endif

  call s:SetModeMap()
  call s:SetSection()
endfunction

function! s:SetLeftPart() abort
  if !exists('g:neu.stl.left')
    let g:neu.stl.left = {}
  endif

  if !exists('g:neu.stl.left.active')
    let g:neu.stl.left.active = ['mode', 'vcs', 'bufinfo', 'modif']
  endif

  if !exists('g:neu.stl.left.inactive')
    let g:neu.stl.left.inactive = ['bufinfo', 'modif']
  endif
endfunction

function! s:SetRightPart() abort
  if !exists('g:neu.stl.right')
    let g:neu.stl.right = {}
  endif

  if !exists('g:neu.stl.right.active')
    let g:neu.stl.right.active = ['fileinfo', 'ruler']
  endif

  if !exists('g:neu.stl.right.inactive')
    let g:neu.stl.right.inactive = ['ruler']
  endif
endfunction

function! s:SetModeMap() abort
  if !exists('g:neu.stl.mode_map')
    let g:neu.stl.mode_map = {
          \ 'n':  'N',
          \ 'no': 'NO',
          \ 'i':  'I',
          \ 'v':  'V',
          \ 'V':  'VL',
          \ '': 'VB',
          \ 'R':  'R',
          \ 'r':  'PROMPT',
          \ 'c':  'C',
          \ 't':  'TERMINAL',
          \ 's':  'S',
          \ 'S':  'S',
          \ '': 'S',
          \ '__': '-',
          \ '?':  'UNKNOWN',
          \ }
  endif
endfunction

function! s:SetSection() abort
  if !exists('g:neu.stl.section')
    let g:neu.stl.section = {}
  endif

  let g:neu.stl.section.mode = ['NSmode', [' ', 'neuline#part#mode#_()', ' ']]

  if !exists('g:neu.stl.section.bufinfo')
    let g:neu.stl.section.bufinfo = ['NSbufinfo', neuline#part#bufinfo#_()]
  endif

  if !exists('g:neu.stl.section.modif')
    let g:neu.stl.section.modif = ['NSmodif', neuline#part#modif#_()]
  endif

  if !exists('g:neu.stl.section.fileinfo')
    let g:neu.stl.section.fileinfo = ['NSfileinfo', neuline#part#fileinfo#_()]
  endif

  if !exists('g:neu.stl.section.ruler')
    let g:neu.stl.section.ruler = ['NSruler', neuline#part#ruler#_()]
  endif

  if !exists('g:neu.stl.section.linti')
    let g:neu.stl.section.linti = ['NSlinti', 'neuline#part#lintinfo#_("I")']
  endif
  if !exists('g:neu.stl.section.linth')
    let g:neu.stl.section.linth = ['NSlinth', 'neuline#part#lintinfo#_("H")']
  endif
  if !exists('g:neu.stl.section.lintw')
    let g:neu.stl.section.lintw = ['NSlintw', 'neuline#part#lintinfo#_("W")']
  endif
  if !exists('g:neu.stl.section.linte')
    let g:neu.stl.section.linte = ['NSlinte', 'neuline#part#lintinfo#_("E")']
  endif

  if !exists('g:neu.stl.section.windowswap')
    let g:neu.stl.section.windowswap = ['NSswap', 'neuline#part#windowswap#_()']
  endif

  if !exists('g:neu.stl.section.tagbar')
    let g:neu.stl.section.tagbar = ['NStag', 'neuline#part#tagbar#_()']
  endif

  if !exists('g:neu.stl.section.vcs')
    let g:neu.stl.section.vcs =['NSvcs', 'neuline#part#vcs#_()']
  endif
endfunction
