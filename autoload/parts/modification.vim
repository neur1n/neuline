scriptencoding utf-8

function! parts#modification#status() abort
  let l:modified = '%m '
  let l:readonly = printf('%%{&readonly ? "%s " : ""}', assets#glyph#glyph('readonly'))
  return '%#ZModif#'.l:modified.l:readonly
endfunction
