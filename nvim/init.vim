scriptencoding utf-8
set encoding=utf-8
let g:mapleader = "\<Space>"
let g:VIM_ROOT  = $DOTFILES . '/vim'
let g:NVIM_ROOT = $DOTFILES . '/nvim'

function! s:source_file(filename)
  if !filereadable(a:filename)
    echo 'File Not Found : ' . a:filename
    return
  endif
  execute 'source' . a:filename
endfunction

" options
call s:source_file(g:VIM_ROOT . '/optionrc.vim')

" dein
call s:source_file(g:VIM_ROOT . '/deinrc.vim')

" color
call s:source_file(g:VIM_ROOT . '/colorrc.vim')

" mapping
call s:source_file(g:VIM_ROOT . '/mappingrc.vim')
