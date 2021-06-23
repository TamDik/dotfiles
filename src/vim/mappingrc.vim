" search
nnoremap <silent> <leader><Space> :<C-u>nohlsearch<CR>

" split 
nnoremap <silent> <leader>s :<C-u>split<CR>
nnoremap <silent> <leader>v :<C-u>vsplit<CR>
nnoremap <silent> <leader>q :<C-u>close<CR>
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <Up> :<C-u>resize +1<CR>
nnoremap <silent> <Down> :<C-u>resize -1<CR>
nnoremap <silent> <Left> :<C-u>vertical resize +1<CR>
nnoremap <silent> <Right> :<C-u>vertical resize -1<CR>

" buffer
nnoremap <silent> <leader>j :<C-u>bprevious<CR>
nnoremap <silent> <leader>k :<C-u>bnext<CR>

" toggle wrap and nowrap
command WrapToggle let &wrap = !&wrap
nnoremap <silent> <leader>w :<C-u>WrapToggle<CR>

" break undo sequence
inoremap <C-h> <C-g>u<C-h>
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

" other key mapping
inoremap jj <ESC>
inoremap j<Space> j
nnoremap Y y$
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
if executable('compiler')
  nnoremap <silent> <F5> :w<CR>:!compiler %<CR>
endif
tnoremap <Esc> <C-\><C-n>
