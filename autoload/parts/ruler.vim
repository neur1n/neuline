scriptencoding utf-8

function! parts#ruler#status(ldigit, cdigit) abort
  return '%#ZRuler#'.printf('%%%dl/%%L:%%%dv', a:ldigit, a:cdigit)
endfunction
