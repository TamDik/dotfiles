set shortmess+=Is
set completeopt=menuone
set spelllang+=cjk
set backspace=indent,start,eol
"set ambiwidth=double
set background=dark
set noshowcmd
set noshowmode
set noruler
set hidden
set number
set relativenumber
set laststatus=2
set cmdheight=1
set wrap
set list
set listchars=tab:>-,trail:-
set scrolloff=3
set wildmenu
set updatetime=500
filetype plugin indent on

if has('nvim')
  set shada=!,'500,<50,s10,h
else
  set viminfo=!,'500,<50,s10,h
endif

set helplang=ja,en

" indent
set autoindent
set smartindent
set cindent

" bell
set novisualbell
set t_vb=
set belloff=all

" conceal
set conceallevel=0
set concealcursor=nv

" backup files
set backup
set backupext=~
set noswapfile
set undofile

let s:nvim_root = expand('~/.nvim')
if !isdirectory(s:nvim_root)
  call mkdir(s:nvim_root, 'p')
endif
let s:backup_path =  s:nvim_root . '/backup'
let s:undo_path = s:nvim_root . '/undo'
let &undodir = s:undo_path
let &backupdir = s:backup_path

" tab
set tabstop=4
set shiftwidth=0
set expandtab
augroup TabSetting
  autocmd!
  autocmd FileType vim,yaml,toml,markdown,xml,html,sh,zsh,typescriptreact,javascript,typescript,json setlocal tabstop=2
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

" true color
function! IsAvailableTrueColor()
  return $COLORTERM == 'truecolor' || $COLORTERM == '24bit'
endfunction

if IsAvailableTrueColor()
  set termguicolors
endif

" folding
set foldmethod=indent
set foldcolumn=0
set foldlevel=20
set foldlevelstart=-1
