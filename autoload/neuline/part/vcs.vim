scriptencoding utf-8

function! neuline#part#vcs#_() abort
  if exists('g:loaded_gitbranch')
    return gitbranch#name() ==# '' ? '' : ' '.gitbranch#name()
  else
    return ''
  endif
endfunction
