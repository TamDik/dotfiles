set shortmess+=I
set completeopt=menuone
set spelllang+=cjk
set visualbell t_vb=
set backspace=indent,start,eol
set ambiwidth=double
set noshowcmd
set noshowmode
set hidden
set number relativenumber
filetype plugin indent on
syntax enable

if has('nvim')
  let s:root_dir = g:NVIM_ROOT
else
  let s:root_dir = g:VIM_ROOT
endif

if !has('nvim')
  let s:info_path   = s:root_dir . '/viminfo'
  execute 'set viminfo+=n' . s:info_path
endif

" backup files and so on
set backupext=.bat
set backup
set swapfile
set undofile

let s:backup_path = s:root_dir . '/backup'
let s:swap_path   = s:root_dir . '/swap'
let s:undo_path   = s:root_dir . '/undo'
if !isdirectory(s:backup_path)
  call mkdir(s:backup_path, 'p')
endif
if !isdirectory(s:swap_path)
  call mkdir(s:swap_path,   'p')
endif
if !isdirectory(s:undo_path)
  call mkdir(s:undo_path,   'p')
endif
let &backupdir = s:backup_path
let &directory = s:swap_path
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
