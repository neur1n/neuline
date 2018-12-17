scriptencoding utf-8

"********************************************************************* {Gruvbox
" -= Dark mode =-
let s:gruvbox = {
      \ 'aqua':   ['#8ec07c', 108],
      \ 'blue':   ['#83a598', 109],
      \ 'green':  ['#b8bb26', 142],
      \ 'orange': ['#fe8019', 208],
      \ 'purple': ['#d3869b', 175],
      \ 'red':    ['#fb4934', 167],
      \ 'yellow': ['#fabd2f', 214],
      \ 'bg0_h':  ['#1d2021', 234],
      \ 'bg0':    ['#282828', 235],
      \ 'bg0_s':  ['#32302f', 236],
      \ 'fg0':    ['#fbf1c7', 229],
      \ 'fg1':    ['#ebdbb2', 223],
      \ 'fg2':    ['#d5c4a1', 250],
      \ 'fg3':    ['#bdae93', 248],
      \ 'fg4':    ['#a89984', 246],
      \ 'gray':   ['#928374', 245],
      \ }
" }

"******************************************************************* {Solarized
" -= Dark mode =-
let s:solarize = {
      \ 'blue':    ['#268bd2', 32],
      \ 'cyan':    ['#2aa198', 36],
      \ 'green':   ['#859900', 106],
      \ 'orange':  ['#cb4b16', 166],
      \ 'magneta': ['#d33682', 168],
      \ 'red':     ['#dc322f', 160],
      \ 'violet':  ['#6c71c4', 62],
      \ 'yellow':  ['#b58900', 136],
      \ 'base03':  ['#002b36', 234],
      \ 'base02':  ['#073642', 235],
      \ 'base01':  ['#586e75', 242],
      \ 'base00':  ['#657b83', 66],
      \ 'base0':   ['#839496', 246],
      \ 'base1':   ['#93a1a1', 247],
      \ 'base2':   ['#eee8d5', 254],
      \ 'base3':   ['#fdf6e3', 230],
      \ }
" }

"************************************************************** {Choose Palette
" S-static, N-normal, I-insert, V-visual, R-replace, C-cmdline, U-inactive
function! assets#palette#Palette() abort
  if g:colors_name ==# 'gruvbox'
    let l:palette = {
          \ 'H_bg': s:gruvbox.bg0_h,
          \ 'M_bg': s:gruvbox.bg0,
          \ 'S_bg': s:gruvbox.bg0_s,
          \ 'S_vcs': s:gruvbox.fg0,
          \ 'S_swap': s:gruvbox.orange,
          \ 'S_tag': s:gruvbox.fg1,
          \ 'S_info': s:gruvbox.gray,
          \ 'S_spc': s:gruvbox.yellow,
          \ 'S_warn': s:gruvbox.orange,
          \ 'S_err': s:gruvbox.red,
          \ 'N_mode': s:gruvbox.green,
          \ 'N_name': s:gruvbox.aqua,
          \ 'N_modi': s:gruvbox.red,
          \ 'N_ruler': s:gruvbox.green,
          \ 'I_mode': s:gruvbox.aqua,
          \ 'I_name': s:gruvbox.blue,
          \ 'I_modi': s:gruvbox.red,
          \ 'I_ruler': s:gruvbox.aqua,
          \ 'V_mode': s:gruvbox.yellow,
          \ 'V_name': s:gruvbox.orange,
          \ 'V_modi': s:gruvbox.red,
          \ 'V_ruler': s:gruvbox.yellow,
          \ 'R_mode': s:gruvbox.purple,
          \ 'R_name': s:gruvbox.blue,
          \ 'R_modi': s:gruvbox.red,
          \ 'R_ruler': s:gruvbox.purple,
          \ 'C_mode': s:gruvbox.red,
          \ 'C_name': s:gruvbox.aqua,
          \ 'C_modi': s:gruvbox.red,
          \ 'C_ruler': s:gruvbox.red,
          \ 'U_mode': s:gruvbox.fg1,
          \ 'U_name': s:gruvbox.fg1,
          \ 'U_modi': s:gruvbox.purple,
          \ 'U_ruler': s:gruvbox.fg1,
          \ 'T_left': s:gruvbox.blue,
          \ 'T_right': s:gruvbox.orange,
          \ 'T_fg': s:gruvbox.bg0_h,
          \ 'T_bg': s:gruvbox.fg1,
          \ }
  elseif g:colors_name ==# 'solarized'
    " let l:palette = {
    "       \ 'S_bg': s:solarized.base03,
    "       \ 'U_bg': s:solarized.base01,
    "       \ 'S_vcs': s:solarized.base2,
    "       \ 'S_tag': s:solarized.base2,
    "       \ 'S_swap': s:solarized.cyan,
    "       \ 'S_info': s:solarized.gray,
    "       \ 'S_spc': s:solarized.yellow,
    "       \ 'S_warn': s:solarized.orange,
    "       \ 'S_err': s:solarized.red,
    "       \ 'N_mode': s:solarized.green,
    "       \ 'N_name': s:solarized.aqua,
    "       \ 'N_modi': s:solarized.red,
    "       \ 'N_ruler': s:solarized.green,
    "       \ 'I_mode': s:solarized.aqua,
    "       \ 'I_name': s:solarized.blue,
    "       \ 'I_modi': s:solarized.red,
    "       \ 'I_ruler': s:solarized.aqua,
    "       \ 'V_mode': s:solarized.yellow,
    "       \ 'V_name': s:solarized.orange,
    "       \ 'V_modi': s:solarized.red,
    "       \ 'V_ruler': s:solarized.yellow,
    "       \ 'R_mode': s:solarized.purple,
    "       \ 'R_name': s:solarized.blue,
    "       \ 'R_modi': s:solarized.red,
    "       \ 'R_ruler': s:solarized.purple,
    "       \ 'C_mode': s:solarized.red,
    "       \ 'C_name': s:solarized.aqua,
    "       \ 'C_modi': s:solarized.red,
    "       \ 'C_ruler': s:solarized.red,
    "       \ 'U_name': s:solarized.fg1,
    "       \ 'U_modi': s:solarized.purple,
    "       \ 'U_ruler': s:solarized.fg1,
    "       \ }
  endif

  return l:palette
endfunction
