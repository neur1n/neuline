scriptencoding utf-8

function! neuline#stl#init#Construct(status) abort
  return s:LeftPart(a:status).'%=%<'.s:RightPart(a:status)
        \ .'%{neuline#stl#highlight#Link()}'
endfunction

function! s:LeftPart(status) abort
  let l:default = neuline#part#default#Config('stl')
  let l:config = get(get(g:, 'neuline', {}), 'stl', {})

  let l:left = ''

  if a:status ==# 'active'
    for s in l:config.left.active
      if !has_key(l:config, 'definition') || !has_key(l:config.definition, s)
        let l:left .= neuline#section#Create(
              \ 1, l:default.definition[s]['tag'], l:default.definition[s]['def'])
      else
        let l:left .= neuline#section#Create(
              \ 1, l:config.definition[s]['tag'], l:config.definition[s]['def'])
      endif
    endfor
  elseif a:status ==# 'inactive'
    for s in l:config.left.inactive
      if !has_key(l:config.definition, s)
        let l:left .= neuline#section#Create(
              \ 0, l:default.definition[s]['tag'], l:default.definition[s]['def'])
      else
      let l:left .= neuline#section#Create(
            \ 0, l:config.definition[s]['tag'], l:config.definition[s]['def'])
      endif
    endfor
  endif

  return l:left
endfunction

function! s:RightPart(status) abort
  let l:default = neuline#part#default#Config('stl')
  let l:config = get(get(g:, 'neuline', {}), 'stl', {})

  let l:right = ''

  if a:status ==# 'active'
    for s in l:config.right.active
      if !has_key(l:config.definition, s)
        let l:right .= neuline#section#Create(
              \ 1, l:default.definition[s]['tag'], l:default.definition[s]['def'])
      else
        let l:right .= neuline#section#Create(
              \ 1, l:config.definition[s]['tag'], l:config.definition[s]['def'])
      endif
    endfor
  elseif a:status ==# 'inactive'
    for s in l:config.right.inactive
      if !has_key(l:config.definition, s)
        let l:right .= neuline#section#Create(
              \ 0, l:default.definition[s]['tag'], l:default.definition[s]['def'])
      else
      let l:right .= neuline#section#Create(
            \ 0, l:config.definition[s]['tag'], l:config.definition[s]['def'])
      endif
    endfor
  endif

  return l:right
endfunction
