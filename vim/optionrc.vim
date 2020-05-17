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

" backup files and so on
if !has('nvim')
  let s:backup_path = g:VIM_ROOT . '/temp/backup'
  let s:swap_path   = g:VIM_ROOT . '/temp/swap'
  let s:undo_path   = g:VIM_ROOT . '/temp/undo'
  let s:info_path   = g:VIM_ROOT . '/viminfo'
  if !isdirectory(s:backup_path)
    call mkdir(s:backup_path, 'p')
  endif
  if !isdirectory(s:swap_path)
    call mkdir(s:swap_path,   'p')
  endif
  if !isdirectory(s:undo_path)
    call mkdir(s:undo_path,   'p')
  endif
  set backup
  set swapfile
  set undofile
  execute 'set backupdir=' . s:backup_path
  execute 'set directory=' . s:swap_path
  execute 'set undodir='   . s:undo_path
  execute 'set viminfo+=n' . s:info_path
endif

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
