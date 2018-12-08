scriptencoding utf-8

function! parts#tagbar#tag(format, default, ...) abort
  if exists(':Tagbar')
    if a:0 == 0
      return '%#ZTag#'.printf('%%{tagbar#currenttag(%s, %s)}', a:format, a:default)
    else
      return '%#ZTag#'.printf('%%{tagbar#currenttag(%s, %s, %s)}', a:format, a:default, a:1)
    endif
  else
    return ''
  endif
endfunction
