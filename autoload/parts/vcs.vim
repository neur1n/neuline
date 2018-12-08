scriptencoding utf-8

function! parts#vcs#branch() abort
    if exists('g:loaded_gitbranch')
        " return '%#ZVCS#'.(gitbranch#name() ==# '' ? '' : ' %{gitbranch#name()} ')
        return '%#ZVCS# %{gitbranch#name()} '
    else
        return ''
    endif
endfunction
