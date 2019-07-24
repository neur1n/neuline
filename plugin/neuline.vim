scriptencoding utf-8

if exists('g:loaded_neuline')
  finish
endif
let g:loaded_neuline = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

call neuline#stl#highlight#Init()
call neuline#tal#highlight#Init()

augroup neustl
  autocmd!
  autocmd WinEnter,BufWinEnter,FileType,SessionLoadPost * call neustl#Update()
  autocmd BufUnload,BufWinLeave,CursorMoved * call neustl#UpdateOnce()
  autocmd ColorScheme,SessionLoadPost * call neuline#stl#highlight#Link()
augroup END

augroup neutal
  autocmd!
  autocmd WinEnter,BufUnload,BufWinEnter,FileType,SessionLoadPost * call neutal#Update()
  autocmd ColorScheme,SessionLoadPost * call neuline#tal#highlight#Link()
augroup END

let &cpoptions = s:save_cpo
unlet s:save_cpo
