"color
let s:transparent = 0
function! s:is_transparent()
  let l:color_schemes = ['iceberg', 'edge']
  return s:transparent
  " return s:transparent && match(l:color_schemes, g:colors_name) != -1
endfunction
command TransparencyToggle let s:transparent = 1 - s:transparent | execute "colorscheme " . g:colors_name

function! s:bg_to_transparent()
  if !has('gui')
    highlight Normal ctermbg=NONE guibg=NONE
  endif
  highlight LineNr      ctermbg=NONE guibg=NONE
  highlight NonText     ctermbg=NONE guibg=NONE
  highlight EndOfBuffer ctermbg=NONE guibg=NONE
  highlight SignColumn  ctermbg=NONE guibg=NONE
  highlight Conceal     ctermbg=NONE guibg=NONE
  highlight Folded      ctermbg=NONE guibg=NONE
  highlight FoldColumn  ctermbg=NONE guibg=NONE
endfunction

augroup TransparentBG
  autocmd!
  autocmd ColorScheme * if s:is_transparent() | call s:bg_to_transparent() | endif
augroup END
