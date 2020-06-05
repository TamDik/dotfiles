"color
augroup TransparentBG
  autocmd!
  if !has('gui')
    autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
  endif
  autocmd ColorScheme * highlight LineNr      ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight NonText     ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight SignColumn  ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight Conceal     ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight Folded      ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight FoldColumn  ctermbg=NONE guibg=NONE
augroup END
