scriptencoding utf-8

function! neuline#section#Create(active, group, ...) abort
  " The additional argument should be an item or a list of items to be
  " evaluated. Or leave empty to create a highlight group only.
  if a:group ==# ''
    let l:group = ''
  else
    if a:active
      let l:group = printf('%%#%s#', a:group)
    else
      let l:group = printf('%%#%sIN#', a:group)
    endif
  endif

  " If the item is a function, then wrap it with '%{}'. Otherwise,
  " append it directly, like '%t' (file name) or ':' (colon character).
  let l:eval = ''
  if a:0
    let l:item_list = type(a:1) == v:t_string ? [a:1] : a:1
    for item in l:item_list
      if item =~# '^%\a' || item =~# '^\A\+'
        let l:eval .= item
      else
        let l:eval .= printf('%%{%s}', item)
      endif
    endfor
  endif

  return l:group.l:eval
endfunction
