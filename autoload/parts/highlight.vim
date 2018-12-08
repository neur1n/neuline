scriptencoding utf-8

let s:palette = assets#palette#palette()

function! parts#highlight#update(...) abort
  for l:w in range(1, winnr('$'))
    if exists('w:inactive') && w:inactive == 1
      call s:hi_inactive()
    else
      let l:mode = a:0 ? a:1 : mode()
      if l:mode ==# 's'
        call s:hi_static()
      elseif l:mode =~# '\v(n|no)'
        call s:hi_normal()
      elseif l:mode ==# 'i'
        call s:hi_insert()
      elseif l:mode =~# '\v(v|V|)'
        " elseif s:mode_map[mode()] =~# 'V'
        call s:hi_visual()
      elseif l:mode =~# '\v(r|R)'
        call s:hi_replace()
      elseif l:mode ==# 'c'
        call s:hi_cmdline()
      else
        call s:hi_normal()
      endif
    endif
  endfor
  return ''
endfunction

function! s:highlight(group, guifg, guibg, ctermfg, ctermbg, style) abort
  exec printf('hi %s guifg=%s guibg=%s ctermfg=%s ctermbg=%s gui=%s cterm=%s',
        \ a:group, a:guifg, a:guibg, a:ctermfg, a:ctermbg, a:style, a:style)
endfunction

function! s:hi_static() abort
  if exists('g:loaded_windowswap')
    call s:highlight('ZSwap', s:palette.S_swap[0], s:palette.S_bg[0],
          \ s:palette.S_swap[1], s:palette.S_bg[1], 'bold')
  endif
  if exists('g:loaded_gitbranch')
    call s:highlight('ZVCS', s:palette.S_vcs[0], s:palette.S_bg[0],
          \ s:palette.S_vcs[1], s:palette.S_bg[1], 'bold')
  endif
  if exists(':Tagbar')
    call s:highlight('ZTag', s:palette.S_tag[0], s:palette.S_bg[0],
          \ s:palette.S_tag[1], s:palette.S_bg[1], 'italic')
  endif
  call s:highlight('ZInfo', s:palette.S_info[0], s:palette.S_bg[0],
        \ s:palette.S_info[1], s:palette.S_bg[1], 'NONE')

  call s:highlight('ZWhitespace', s:palette.S_spc[0], s:palette.S_bg[0],
        \ s:palette.S_spc[1], s:palette.S_bg[1], 'bold')
  call s:highlight('ZWarning', s:palette.S_warn[0], s:palette.S_bg[0],
        \ s:palette.S_warn[1], s:palette.S_bg[1], 'bold')
  call s:highlight('ZError', s:palette.S_err[0], s:palette.S_bg[0],
        \ s:palette.S_err[1], s:palette.S_bg[1], 'bold')
endfunction

function! s:hi_normal() abort
  call s:highlight('ZMode', s:palette.S_bg[0], s:palette.N_mode[0],
        \ s:palette.S_bg[1], s:palette.N_mode[1], 'bold')
  call s:highlight('ZName', s:palette.N_name[0], s:palette.S_bg[0],
        \ s:palette.N_name[1], s:palette.S_bg[1], 'bold')
  call s:highlight('ZModif', s:palette.N_modi[0], s:palette.S_bg[0],
        \ s:palette.N_modi[1], s:palette.S_bg[1], 'bold')
  call s:highlight('ZRuler', s:palette.N_ruler[0], s:palette.S_bg[0],
        \ s:palette.N_ruler[1], s:palette.S_bg[1], 'NONE')
endfunction

function! s:hi_insert() abort
  call s:highlight('ZMode', s:palette.S_bg[0], s:palette.I_mode[0],
        \ s:palette.S_bg[1], s:palette.I_mode[1], 'bold')
  call s:highlight('ZName', s:palette.I_name[0], s:palette.S_bg[0],
        \ s:palette.I_name[1], s:palette.S_bg[1], 'bold')
  call s:highlight('ZModif', s:palette.I_modi[0], s:palette.S_bg[0],
        \ s:palette.I_modi[1], s:palette.S_bg[1], 'bold')
  call s:highlight('ZRuler', s:palette.I_ruler[0], s:palette.S_bg[0],
        \ s:palette.I_ruler[1], s:palette.S_bg[1], 'NONE')
endfunction

function! s:hi_visual() abort
  call s:highlight('ZMode', s:palette.S_bg[0], s:palette.V_mode[0],
        \ s:palette.S_bg[1], s:palette.V_mode[1], 'bold')
  call s:highlight('ZName', s:palette.V_name[0], s:palette.S_bg[0],
        \ s:palette.V_name[1], s:palette.S_bg[1], 'bold')
  call s:highlight('ZModif', s:palette.V_modi[0], s:palette.S_bg[0],
        \ s:palette.V_modi[1], s:palette.S_bg[1], 'bold')
  call s:highlight('ZRuler', s:palette.V_ruler[0], s:palette.S_bg[0],
        \ s:palette.V_ruler[1], s:palette.S_bg[1], 'NONE')
endfunction

function! s:hi_replace() abort
  call s:highlight('ZMode', s:palette.S_bg[0], s:palette.R_mode[0],
        \ s:palette.S_bg[1], s:palette.R_mode[1], 'bold')
  call s:highlight('ZName', s:palette.R_name[0], s:palette.S_bg[0],
        \ s:palette.R_name[1], s:palette.S_bg[1], 'bold')
  call s:highlight('ZModif', s:palette.R_modi[0], s:palette.S_bg[0],
        \ s:palette.R_modi[1], s:palette.S_bg[1], 'bold')
  call s:highlight('ZRuler', s:palette.R_ruler[0], s:palette.S_bg[0],
        \ s:palette.R_ruler[1], s:palette.S_bg[1], 'NONE')
endfunction

function! s:hi_cmdline() abort
  call s:highlight('ZMode', s:palette.S_bg[0], s:palette.C_mode[0],
        \ s:palette.S_bg[1], s:palette.C_mode[1], 'bold')
  call s:highlight('ZName', s:palette.C_name[0], s:palette.S_bg[0],
        \ s:palette.C_name[1], s:palette.S_bg[1], 'bold')
  call s:highlight('ZModif', s:palette.C_modi[0], s:palette.S_bg[0],
        \ s:palette.C_modi[1], s:palette.S_bg[1], 'bold')
  call s:highlight('ZRuler', s:palette.C_ruler[0], s:palette.S_bg[0],
        \ s:palette.C_ruler[1], s:palette.S_bg[1], 'NONE')
endfunction

function! s:hi_inactive() abort
    call s:highlight('ZName', s:palette.U_name[0], s:palette.S_bg[0],
                \ s:palette.U_name[1], s:palette.S_bg[1], 'bold')
    call s:highlight('ZModif', s:palette.U_modi[0], s:palette.S_bg[0],
                \ s:palette.U_modi[1], s:palette.S_bg[1], 'bold')
    call s:highlight('ZRuler', s:palette.U_ruler[0], s:palette.S_bg[0],
                \ s:palette.U_ruler[1], s:palette.S_bg[1], 'NONE')
endfunction
