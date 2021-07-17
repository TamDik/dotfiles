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

" break undo sequence
inoremap <C-h> <C-g>u<C-h>
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

" escape
inoremap jj <ESC>
inoremap j<Space> j
if has('nvim')
  tnoremap jj <C-\><C-n>
else
  tnoremap jj <C-w>N
endif
tnoremap j<Space> j

" command line
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Del>

" other key mapping
nnoremap Y y$
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
if executable('compiler')
  nnoremap <silent> <F5> :w<CR>:!compiler %<CR>
endif
