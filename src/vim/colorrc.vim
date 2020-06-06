"color
let s:transparent = 1
function s:is_transparent()
  if !s:transparent
    return 0
  endif
  let l:color_schemes = ['iceberg', 'blue']
  return match(l:color_schemes, g:colors_name) != -1
endfunction
command TransparencyToggle let s:transparent = 1 - s:transparent | execute "colorscheme " . g:colors_name

augroup TransparentBG
  autocmd!
  autocmd ColorScheme * if s:is_transparent() && !has('gui') | highlight Normal      ctermbg=NONE guibg=NONE | endif
  autocmd ColorScheme * if s:is_transparent()                | highlight LineNr      ctermbg=NONE guibg=NONE | endif
  autocmd ColorScheme * if s:is_transparent()                | highlight NonText     ctermbg=NONE guibg=NONE | endif
  autocmd ColorScheme * if s:is_transparent()                | highlight EndOfBuffer ctermbg=NONE guibg=NONE | endif
  autocmd ColorScheme * if s:is_transparent()                | highlight SignColumn  ctermbg=NONE guibg=NONE | endif
  autocmd ColorScheme * if s:is_transparent()                | highlight Conceal     ctermbg=NONE guibg=NONE | endif
  autocmd ColorScheme * if s:is_transparent()                | highlight Folded      ctermbg=NONE guibg=NONE | endif
  autocmd ColorScheme * if s:is_transparent()                | highlight FoldColumn  ctermbg=NONE guibg=NONE | endif
augroup END
