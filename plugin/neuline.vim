scriptencoding utf-8

if exists('g:loaded_neuline')
  finish
endif
let g:loaded_neuline = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

call neuline#stl#default#Init()
call neuline#stl#highlight#Init()

call neuline#tal#default#Init()
call neuline#tal#highlight#Init()

augroup neustl
  autocmd!
  autocmd WinEnter,BufWinEnter,FileType,SessionLoadPost * call neustl#Update()
  autocmd BufUnload,BufWinLeave * call neustl#UpdateOnce()
  autocmd ColorScheme,SessionLoadPost * call neuline#stl#highlight#Link()
  if exists('g:loaded_neurun')
    autocmd User NeurunAction call neustl#UpdateOnce()
  endif
  if exists('g:loaded_neomake')
    autocmd User NeomakeCountsChanged call neuline#part#lintinfo#Update()
  elseif exists('g:did_coc_loaded')
    autocmd User CocDiagnosticChange call neuline#part#lintinfo#Update()
  endif
augroup END

augroup neutal
  autocmd!
  autocmd WinEnter,BufUnload,BufWinEnter,FileType,SessionLoadPost * call neutal#Update()
  autocmd ColorScheme,SessionLoadPost * call neuline#tal#highlight#Link()
  if exists('g:loaded_neurun')
    autocmd User NeurunAction call neutal#Update() | call neuline#tal#highlight#Link()
  endif
augroup END

nnoremap <silent> <C-p> :call neuline#part#lintinfo#Jump('prev')<cr>
nnoremap <silent> <C-n> :call neuline#part#lintinfo#Jump('next')<cr>
nnoremap <silent> <leader>tw :call neuline#part#whitespace#Trim()<cr>

let &cpoptions = s:save_cpo
unlet s:save_cpo
