" search
nnoremap <silent> <leader><Space> <Cmd>nohlsearch<CR>

" split
nnoremap <silent> <leader>s <Cmd>split<CR>
nnoremap <silent> <leader>v <Cmd>vsplit<CR>
nnoremap <silent> <leader>q <Cmd>close<CR>

" buffer
nnoremap <silent> <leader>j <Cmd>bprevious<CR>
nnoremap <silent> <leader>k <Cmd>bnext<CR>

" break undo sequence
inoremap <C-h> <C-g>u<C-h>
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

" write
nnoremap <leader>w <Cmd>update<CR>

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

" sticky shift
inoremap <expr> ; <SID>sticky_func()
cnoremap <expr> ; <SID>sticky_func()
snoremap <expr> ; <SID>sticky_func()
function! s:sticky_func() abort
  let sticky_table = {
        \',' : '<', '.' : '>', '/' : '?',
        \'1' : '!', '2' : '@', '3' : '#', '4' : '$', '5' : '%',
        \'6' : '^', '7' : '&', '8' : '*', '9' : '(', '0' : ')',
        \ '-' : '_', '=' : '+',
        \';' : ':', '[' : '{', ']' : '}', '`' : '~', "'" : "\"", '\' : '|',
        \}
  let special_table = {
        \ "\<ESC>": "\<ESC>", "\<Space>": ';', "\<CR>": ";\<CR>",
        \ }
  let char = ''
  while 1
    silent! let char = nr2char(getchar())
    if char =~# '\l'
      let char = toupper(char)
      break
    elseif has_key(sticky_table, char)
      let char = sticky_table[char]
      break
    elseif has_key(special_table, char)
      let char = special_table[char]
      break
    endif
  endwhile
  return char
endfunction
