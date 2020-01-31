scriptencoding utf-8
set encoding=utf-8
set shortmess+=I
set completeopt=menuone
set spelllang+=cjk
set visualbell t_vb=
set backspace=indent,start
set ambiwidth=double
set noshowcmd
set noshowmode
set hidden
set number relativenumber
let mapleader = "\<Space>"
filetype plugin indent on
syntax enable


" dein
let s:dein_rc = $DOTFILES . '/vim/deinrc.vim'
if filereadable(s:dein_rc)
  execute 'source' s:dein_rc
endif


" color
augroup TransparentBG
  autocmd!
  autocmd ColorScheme * highlight Normal      ctermbg=none
  autocmd ColorScheme * highlight LineNr      ctermbg=none
  autocmd ColorScheme * highlight Folded      ctermbg=none
  autocmd ColorScheme * highlight NonText     ctermbg=none
  autocmd ColorScheme * highlight EndOfBuffer ctermbg=none
augroup END
syntax on


" parentheses
set showmatch
set matchtime=1


" backup files and so on
let s:vim_path  = $DOTFILES . '/vim'
let s:backup_path = s:vim_path . '/temp/backup'
let s:swap_path   = s:vim_path . '/temp/swap'
let s:undo_path   = s:vim_path . '/temp/undo'
let s:info_path   = s:vim_path . '/viminfo'
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


" tab
set tabstop=2
set shiftwidth=0
set expandtab
augroup TabSetting
  autocmd!
  autocmd FileType python   setlocal tabstop=4
  autocmd FileType markdown setlocal tabstop=2
  autocmd FileType java     setlocal tabstop=4
augroup END


" ctags
set tags=./tags,tags,./.tags,.tags

function! s:tags_file()
  if filereadable('./.tags')
    return './.tags'
  endif
  return './tags'
endfunction

function! s:make_tags()
  if executable('ctags')
    call system("ctags -R -f " . s:tags_file())
  endif
endfunction

function! s:write_buffer()
  if filereadable('./tags') || filereadable('./.tags')
    call s:make_tags()
  endif
endfunction

command MakeTags call s:make_tags()
autocmd BufWritePost * call s:write_buffer()


" search
set incsearch
set hlsearch
set ignorecase
set smartcase
set infercase
nnoremap <silent> <leader><Space> :nohl<CR>


" split 
set splitbelow
set splitright
nnoremap <leader>s :sp<CR>
nnoremap <leader>v :vs<CR>
nnoremap <leader>q :q<CR>


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

