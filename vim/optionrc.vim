set shortmess+=I
set completeopt=menuone
set spelllang+=cjk
set backspace=indent,start,eol
set ambiwidth=double
set noshowcmd
set noshowmode
set hidden
set number relativenumber
set wildmenu
filetype plugin indent on
syntax enable

if has('nvim')
  set viminfo=!,'500,<50,s10,h
else
  set viminfo=!,'500,<50,s10,h
  execute 'set viminfo+=n' . g:ROOT_DIR . '/viminfo'
endif

" bell
set novisualbell
set t_vb=
set belloff=all

" backup files and so on
set nobackup
set backupext=.bat
set noswapfile
set undofile

let s:undo_path   = g:ROOT_DIR . '/undo'
if !isdirectory(s:undo_path)
  call mkdir(s:undo_path,   'p')
endif
let &undodir   = s:undo_path

" tab
set tabstop=4
set shiftwidth=0
set expandtab
augroup TabSetting
  autocmd!
  let s:file_types = ['vim', 'markdown', 'xml', 'html']
  for s:file_type in s:file_types
    execute 'autocmd FileType ' . s:file_type ' setlocal tabstop=2'
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
