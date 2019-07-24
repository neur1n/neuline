scriptencoding utf-8

function! neuline#part#default#Config(line) abort
  if a:line ==# 'stl'
    let l:config =  {
          \ 'left': {
          \   'active': ['mode', 'bufinfo', 'modif'],
          \   'inactive': ['bufinfo', 'modif']
          \ },
          \ 'right': {
          \   'active': ['fileinfo', 'ruler'],
          \   'inactive': ['ruler']
          \ },
          \ 'definition': {
          \   'mode': {'tag': 'NSmode', 'def': [' ', 'neuline#part#mode#_()', ' ']},
          \   'bufinfo': {'tag': 'NSbufinfo', 'def': neuline#part#bufinfo#_()},
          \   'modif': {'tag': 'NSmodif', 'def': neuline#part#modif#_()},
          \   'fileinfo': {'tag': 'NSfileinfo', 'def': neuline#part#fileinfo#_()},
          \   'ruler': {'tag': 'NSruler', 'def': neuline#part#ruler#_()},
          \ }
          \ }
  else  " if a:line ==# 'tal'
    let l:config =  {
          \ 'left': ['logo', 'bufinfo'],
          \ 'right': ['ctab', 'nctab', 'button'],
          \ 'definition': {
          \   'logo': {'tag': 'NTlogo', 'def': [' ', neuline#part#logo#_('sys'), '%<']},
          \   'bufinfo': {'tag': 'NTbufinfo', 'def': neuline#part#bufinfo#_(['Fcwd'])},
          \   'ctab': {'tag': 'NTctab', 'def': ['neuline#part#tab#Current()', ' ']},
          \   'nctab': {'tag': 'NTnctab', 'def': ['neuline#part#tab#NotCurrent()', ' ']},
          \   'button': {'tag': 'NTbutton', 'def': ['%999X', 'neuline#part#tab#CloseButton()', ' ']},
          \   }
          \ }
  endif

  return l:config
endfunction
