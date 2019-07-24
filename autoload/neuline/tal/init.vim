scriptencoding utf-8

function! neuline#tal#init#Construct() abort
  return s:LeftPart().'%='.s:RightPart()
  return ''
endfunction

function! s:LeftPart() abort
  let l:default = neuline#part#default#Config('tal')
  let l:config = get(get(g:, 'neuline', {}), 'tal', {})

  let l:left = ''

  for s in l:config.left
    if !has_key(l:config, 'definition') || !has_key(l:config.definition, s)
      let l:left .= neuline#section#Create(
            \ 1, l:default.definition[s]['tag'], l:default.definition[s]['def'])
    else
      let l:left .= neuline#section#Create(
            \ 1, l:config.definition[s]['tag'], l:config.definition[s]['def'])
    endif
  endfor

  return l:left
endfunction

function! s:RightPart() abort
  let l:default = neuline#part#default#Config('tal')
  let l:config = get(get(g:, 'neuline', {}), 'tal', {})

  let l:right = ''

  for s in l:config.right
    if !has_key(l:config, 'definition') || !has_key(l:config.definition, s)
      let l:right .= neuline#section#Create(
            \ 1, l:default.definition[s]['tag'], l:default.definition[s]['def'])
    else
      let l:right .= neuline#section#Create(
            \ 1, l:config.definition[s]['tag'], l:config.definition[s]['def'])
    endif
  endfor

  return l:right
endfunction
