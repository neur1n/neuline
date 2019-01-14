scriptencoding utf-8

function! neuline#part#tagbar#_() abort
  if exists(':Tagbar')
    return tagbar#currenttag('%s', '', '%f')
  else
    return ''
  endif
endfunction
