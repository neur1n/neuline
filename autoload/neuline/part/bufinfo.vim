scriptencoding utf-8

let s:func_list = ['Cwd', 'Fcwd', 'Rcwd', 'Name', 'Num']

function! neuline#part#bufinfo#_(...) abort
  " For example, ['Num', ':', 'Cwd', '/', 'Name'] gives '1:preset/bufinfo.vim'.
  let l:format = a:0 ? a:1 : ['Num', ':', 'Name']
  let l:bufinfo = []

  for item in l:format
    if count(s:func_list, item)
      call extend(l:bufinfo, [eval('s:'.item.'()')])
      " let l:bufinfo .= eval('s:'.item.'()')
    else
      call extend(l:bufinfo, [item])
      " let l:bufinfo .= item
    endif
  endfor

  return extend([' '], l:bufinfo)
  " return ' '.l:bufinfo
endfunction

function! s:Cwd() abort
  " For example, if getcwd() gives '/foo/bar', then this gives 'bar'.
  return 'expand("%:p:h:t")'
endfunction

function! s:Fcwd() abort
  " Full path, not using '%F' since it gives '[No Name]' on startup.
  return 'getcwd()'
endfunction

function! s:Rcwd() abort
  " Relative path
  return '%f'
endfunction

function! s:Name() abort
  return '%t'
endfunction

function! s:Num() abort
  return '%n'
endfunction
