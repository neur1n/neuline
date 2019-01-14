scriptencoding utf-8

function! neuline#tal#default#Init() abort
  if !exists('g:neu')
    let g:neu = {}
  endif
  if !exists('g:neu.tal')
    let g:neu.tal = {}
  endif

  if get(g:neu.tal, 'enable', 1)
    set showtabline=2
  endif

  if !get(g:neu.tal, 'faster', 0)
    call s:SetLeftPart()
    call s:SetRightPart()
  endif

  call s:SetSection()
endfunction

function! s:SetLeftPart() abort
  if !exists('g:neu.tal.left')
    let g:neu.tal.left = ['logo', 'bufinfo']
  endif
endfunction

function! s:SetRightPart() abort
  if !exists('g:neu.tal.right')
    let g:neu.tal.right = ['ctab', 'ntab', 'button']
  endif
endfunction

function! s:SetSection() abort
  if !exists('g:neu.tal.section')
    let g:neu.tal.section = {}
  endif

  if !exists('g:neu.tal.section.logo')
    let g:neu.tal.section.logo = ['NTlogo', [' ', neuline#part#logo#_('vim')]]
  endif

  if !exists('g:neu.tal.section.bufinfo')
    let g:neu.tal.section.bufinfo = ['NTbufinfo', neuline#part#bufinfo#_(['Fcwd'])]
  endif

  if !exists('g:neu.tal.section.ctab')
    let g:neu.tal.section.ctab = ['NTctab', 'neuline#part#tab#Current()']
  endif

  if !exists('g:neu.tal.section.ntab')
    let g:neu.tal.section.ntab = ['NTntab', ['neuline#part#tab#NotCurrent()', ' ']]
  endif

  if !exists('g:neu.tal.section.button')
    let g:neu.tal.section.button = ['NTbutton', ['%999X', 'neuline#part#tab#CloseButton()', ' ']]
  endif

  if !exists('g:neu.tal.section.neurun')
    let g:neu.tal.section.neurun = ['NTneurun', [' ', 'neurun#status#Status()']]
  endif
endfunction
