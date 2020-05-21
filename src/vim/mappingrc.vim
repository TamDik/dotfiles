" search
nnoremap <silent> <leader><Space> :<C-u>nohlsearch<CR>

" split 
nnoremap <silent> <leader>s :<C-u>split<CR>
nnoremap <silent> <leader>v :<C-u>vsplit<CR>
nnoremap <silent> <leader>q :<C-u>close<CR>

" buffer
nnoremap <silent> <leader>j :<C-u>bprevious<CR>
nnoremap <silent> <leader>k :<C-u>bnext<CR>

" toggle wrap and nowrap
command WrapToggle let &wrap = !&wrap
nnoremap <silent> <leader>w :<C-u>WrapToggle<CR>

" other key mapping
inoremap jj <ESC>
inoremap j<Space> j
nnoremap Y y$
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
if executable('compiler')
  nnoremap <silent> <F5> :w<CR>:!compiler %<CR>
endif
