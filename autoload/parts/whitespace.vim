scriptencoding utf-8

function! parts#whitespace#next() abort
    let l:pos = searchpos('\v(\s+$)', 'cnw')

    if l:pos[0] == 0
        " return {'pos': [], 'info': ''}
        return ''
    else
        " return {'pos': l:pos, 'info': ''.'('.l:pos[0].')'}
        " return {'pos': l:pos, 'info': printf('%s(%s%d)',
        "                                    \ assets#glyph#glyph('wspc'),
        "                                    \ assets#glyph#glyph('lnum'),
        "                                    \ l:pos[0])}
        return '%#ZWhitespace#'.printf('%s(%s%%{%d})',
                                     \ assets#glyph#glyph('wspc'),
                                     \ assets#glyph#glyph('lnum'),
                                     \ l:pos[0])
    endif
endfunction

function! parts#whitespace#trim() abort
    execute '%s/\s\+$//g'
endfunction
