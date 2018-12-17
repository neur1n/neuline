scriptencoding utf-8

" Must use double quotes to wrap unicode codes.
" Ordered by their location.
" Most of the names follow those on https://nerdfonts.com/#cheat-sheet.

" Candidates:
" ["\ue62b", '']
" ["\ufb2b", 'שׂ']
" ["\uf83d", '']
" ["\uf023", '']
" ["\uf456", '']
" ["\uf8e9", '']
" ["\uf8ea", '']
" ["\u039e", 'Ξ']
" ["\uf0e7", '']
" ["\ue20d", '']
" ["\u2573", '╳']
" ["\ue009", '']
" ["\uf12a", '']

let s:glyph = {
      \ 'vim':        ["\ue75c", ''],
      \ 'branch':     ["\ue0a0", ''],
      \ 'readonly':   ["\ue0a2", ''],
      \ 'modified':   ["\uf040", ''],
      \ 'windowswap': ["\uf46a", ''],
      \ 'linux':      ["\uf17c", ''],
      \ 'mac':        ["\ue711", ''],
      \ 'win':        ["\uf17a", ''],
      \ 'lnum':       ["\ue0a1", ''],
      \ 'cnum':       ["\ue0a3", ''],
      \ 'check':      ["\u2713", '✓'],
      \ 'wspc':       ["\ue612", ''],
      \ 'warning':    ["\uf740", ''],
      \ 'error':      ["\u2718", '✘'],
      \ 'info':       ["\uf129", ''],
      \ 'hint':       ["\uf834", ''],
      \ 'question':   ["\uf128", ''],
      \ 'close':      ["\uf00d", ''],
      \ }

function! assets#glyph#glyph(name, ...)
  if a:0 == 0
    return s:glyph[a:name][0]
  else
    return s:glyph[a:name][a:1]
  endif
endfunction
