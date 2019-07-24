scriptencoding utf-8

function! neuline#part#fileinfo#_() abort
  let l:ft = '%Y'
  let l:fenc = '%{&fileencoding ? &fileencoding : &encoding}'
  let l:ff = '%{&fileformat}'

  return printf(' %s[%s:%s] ', l:ft, l:fenc, l:ff)
endfunction
