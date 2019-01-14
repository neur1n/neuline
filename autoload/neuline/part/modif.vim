scriptencoding utf-8

function! neuline#part#modif#_() abort
  return ' %m'.'%{&readonly ? " " : ""}'
endfunction
