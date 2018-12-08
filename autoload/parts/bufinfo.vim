scriptencoding utf-8

let s:funclist = ['cwd', 'fcwd', 'rcwd', 'name', 'num']

function! parts#bufinfo#status(...) abort
    " For example, ('num', ':', 'cwd', '/', 'name') gives '1:parts/bufinfo.vim'
    let l:bufinfo = ''

    if a:0 == 0
        let l:bufinfo = s:name()
    else
        for l:arg in a:000
            if count(s:funclist, l:arg)
                let l:bufinfo .= eval(printf('s:%s()', l:arg))
            else
                let l:bufinfo .= l:arg
            endif
        endfor
    endif

    return '%#ZBuf#'.l:bufinfo
endfunction

function! s:cwd() abort
    " For example, if getcwd() gives '/foo/bar', then this gives 'bar'
    return '%{expand{"%:p:h:t"}}'
endfunction

function! s:fcwd() abort
    " Full path
    return '%F'
endfunction

function! s:rcwd() abort
    " Relative path
    return '%f'
endfunction

function! s:name() abort
    return '%t'
endfunction

function! s:num() abort
    return '%n'
endfunction
