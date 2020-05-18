" search
nnoremap <silent> <leader><Space> :<C-u>nohl<CR>

" split 
nnoremap <silent> <leader>s :<C-u>sp<CR>
nnoremap <silent> <leader>v :<C-u>vs<CR>
nnoremap <silent> <leader>q :<C-u>q<CR>

" buffer
nnoremap <silent> <leader>j :<C-u>bprevious<CR>
nnoremap <silent> <leader>k :<C-u>bnext<CR>

" other key mapping
inoremap jj <ESC>
inoremap j<Space> j
nnoremap Y y$
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
if executable('compiler')
  nnoremap <silent> <F5> :w<CR>:!compiler %<CR>
  inoremap <silent> <F5> <ESC>:w<CR>:!compiler %<CR>
endif
