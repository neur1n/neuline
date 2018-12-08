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
    autocmd BufUnload,TextChanged * call zipline#update_once()
    autocmd SessionLoadPost * call parts#highlight#update()
augroup END

nmap <silent> <C-p> :call parts#lintinfo#jump('prev', 1)<cr>
nmap <silent> <C-n> :call parts#lintinfo#jump('next', 1)<cr>
nmap <silent> <leader>tw :call parts#whitespace#trim()<cr>

let &cpoptions = s:save_cpo
unlet s:save_cpo
