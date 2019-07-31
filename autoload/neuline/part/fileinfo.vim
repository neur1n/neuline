scriptencoding utf-8

function! neuline#part#fileinfo#_() abort
  if winwidth(0) >= 80
    let l:ft = '%Y'
    let l:fenc = '%{&fileencoding ? &fileencoding : &encoding}'
    let l:ff = '%{&fileformat}'

    return printf(' %s[%s:%s] ', l:ft, l:fenc, l:ff)
  else
    return '%{""}'
  endif
endfunction
