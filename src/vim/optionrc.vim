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
set nonumber
set norelativenumber
set laststatus=0
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

" backup files and so on
set backup
set backupext=~
set noswapfile
set undofile

let s:backup_path = g:ROOT_DIR . '/backup'
let s:undo_path = g:ROOT_DIR . '/undo'
if !isdirectory(s:undo_path)
  call mkdir(s:undo_path, 'p')
endif
if !isdirectory(s:backup_path)
  call mkdir(s:backup_path, 'p')
endif
let &undodir = s:undo_path
let &backupdir = s:backup_path

" tab
set tabstop=4
set shiftwidth=0
set expandtab
augroup TabSetting
  autocmd!
  autocmd FileType vim,yaml,toml,markdown,xml,html,sh,zsh setlocal tabstop=2
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
set foldcolumn=0
set foldlevel=20
set foldlevelstart=-1
" set foldtext=MyFoldText()

function! s:buffercolumns(buffer)
  let l:num_columns = winwidth(a:buffer) - &foldcolumn
  if &number || &relativenumber
    let l:num_columns -= max([&numberwidth, len(line('$')) + 1])
  endif
  " TODO: if sign column is open, then l:num_columns -= 2
  " if len(sign_getplaced()) != 0
  "   l:num_columns -= 2
  " endif
  return l:num_columns
endfunction

let s:abbrev_fold_mark = '...'
function! MyFoldText()
  let l:ABBREV_MARK = get(s:, 'abbrev_fold_mark', '...')
  let l:num_lines = v:foldend - v:foldstart + 1

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

" mode
function! s:mode_with_skk() abort
  let l:mode = mode()
  let s:mode_map = {
    \   'n': 'N',
    \   'i': 'I',
    \   'R': 'R',
    \   'v': 'V',
    \   'V': 'VL',
    \   "\<C-v>": 'VB',
    \   'c': 'C',
    \   's': 'S',
    \   'S': 'SL',
    \   "\<C-s>": 'SB',
    \   't': 'T',
    \}
  let l:mode_str = get(s:mode_map, l:mode, l:mode)
  if !(exists('*skkeleton#is_enabled') && skkeleton#is_enabled())
    return l:mode_str
  end
  let l:skk_mode = skkeleton#mode()
  let l:eskk_mode_str = get({'hira': 'あ', 'kata': 'ア'}, l:skk_mode, l:skk_mode)
  return l:mode_str . '-' . l:eskk_mode_str
endfunction
command ModeWithSkk echo s:mode_with_skk()
