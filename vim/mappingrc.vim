" search
nnoremap <silent> <leader><Space> :nohl<CR>

" split 
nnoremap <silent> <leader>s :sp<CR>
nnoremap <silent> <leader>v :vs<CR>
nnoremap <silent> <leader>q :q<CR>

" buffer
nnoremap <silent> <leader>j :bprevious<CR>
nnoremap <silent> <leader>k :bnext<CR>

" other key mapping
inoremap jj <ESC>
nnoremap Y y$
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
if executable('compiler')
  nnoremap <silent> <F5> :w<CR>:!compiler %<CR>
  inoremap <silent> <F5> <ESC>:w<CR>:!compiler %<CR>
endif
