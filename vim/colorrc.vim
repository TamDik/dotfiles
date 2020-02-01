"color
augroup TransparentBG
  autocmd!
  autocmd ColorScheme * highlight Normal      ctermbg=none
  autocmd ColorScheme * highlight LineNr      ctermbg=none
  autocmd ColorScheme * highlight Folded      ctermbg=none
  autocmd ColorScheme * highlight NonText     ctermbg=none
  autocmd ColorScheme * highlight EndOfBuffer ctermbg=none
augroup END
syntax on
