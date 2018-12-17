scriptencoding utf-8

if exists('g:loaded_zipline')
  finish
endif
let g:loaded_zipline = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

augroup zipline
  autocmd!
  autocmd WinEnter,BufWinEnter,FileType,SessionLoadPost * call zipline#Update()
  autocmd BufUnload * call zipline#UpdateOnce()
  autocmd ColorScheme,SessionLoadPost * call parts#highlight#Link()
augroup END

nmap <silent> <C-p> :call parts#lintinfo#Jump('prev')<cr>
nmap <silent> <C-n> :call parts#lintinfo#Jump('next')<cr>
nmap <silent> <leader>tw :call parts#whitespace#Trim()<cr>

let &cpoptions = s:save_cpo
unlet s:save_cpo
