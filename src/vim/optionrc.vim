set shortmess+=I
set completeopt=menuone
set spelllang+=cjk
set backspace=indent,start,eol
"set ambiwidth=double
set background=dark
set noshowcmd
set noshowmode
set hidden
set number
set relativenumber
set wildmenu
set updatetime=500
filetype plugin indent on

if has('nvim')
  set shada=!,'500,<50,s10,h
else
  set viminfo=!,'500,<50,s10,h
  execute 'set viminfo+=n' . g:ROOT_DIR . '/viminfo'
endif

" bell
set novisualbell
set t_vb=
set belloff=all

" conceal
set conceallevel=0
set concealcursor=nv

" backup files and so on
set nobackup
set noswapfile
set undofile

let s:undo_path = g:ROOT_DIR . '/undo'
if !isdirectory(s:undo_path)
  call mkdir(s:undo_path, 'p')
endif
let &undodir = s:undo_path

" tab
set tabstop=4
set shiftwidth=0
set expandtab
augroup TabSetting
  autocmd!
  let s:file_types = ['vim', 'toml', 'markdown', 'xml', 'html', 'sh', 'zsh']
  for s:file_type in s:file_types
    execute 'autocmd FileType ' . s:file_type . ' setlocal tabstop=2'
  endfor
augroup END

" parentheses
set showmatch
set matchtime=1

" search
set incsearch
set hlsearch
set ignorecase
set smartcase
set infercase

" split 
set splitbelow
set splitright

" ctags
set tags=./tags,tags,./.tags,.tags

" true color
if IsAvailableTrueColor()
  set termguicolors
endif

" folding
set foldmethod=indent
set foldcolumn=1
set foldlevel=20
set foldtext=MyFoldText()

function s:buffercolumns(buffer)
  let l:num_columns = winwidth(a:buffer) - &foldcolumn
  if &number || &relativenumber
    let l:num_columns -= max([&numberwidth, len(line('$')) + 1])
  endif
  " TODO: if sign column is open, then l:num_columns -= 2
  return l:num_columns
endfunction

let s:abbrev_fold_mark = '...'
function MyFoldText()
  let l:ABBREV_MARK = get(s:, 'abbrev_fold_mark', '...')
  let l:num_lines = v:foldend - v:foldstart + 1
  let l:startline = getline(v:foldstart)

  let l:head = '+' . v:folddashes
  let l:tail = '(' . l:num_lines . ' lines)'
  let l:body = getline(v:foldstart)

  let l:num_columns = s:buffercolumns(0)
  let l:head_length = strdisplaywidth(l:head)
  let l:tail_length = strdisplaywidth(l:tail)
  let l:body_length = l:num_columns - l:head_length - l:tail_length

  let l:truncated_body = l:body[(l:head_length):]
  if strdisplaywidth(l:truncated_body) > l:body_length
    let l:truncated_body = l:truncated_body[:(l:body_length - strdisplaywidth(l:ABBREV_MARK)) - 1] . l:ABBREV_MARK
  endif
  return printf('%s%-*s%s', l:head, l:body_length, l:truncated_body, l:tail)
endfunction
